import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/errors/exceptions.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/data/models/error_response_model.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/data/models/popular_people_model.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/data/models/server_response_model.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/entities/popular_people_entity.dart';
import 'package:http/http.dart' as http;
abstract class PopularPeopleRemoteDataSource{
  Future<List<PopularPeopleEntity>> getPopularPeople(int page,String language);
}

class PopularPeopleRemoteDataSourceImpl implements PopularPeopleRemoteDataSource{
  final http.Client client;
  final String baseUrl;

  PopularPeopleRemoteDataSourceImpl(this.client, this.baseUrl);

  @override
  Future<List<PopularPeopleEntity>> getPopularPeople(int page, String language) async{
    try{

      Map<String, String> params = {
        'api_key':'cd339a9f667acb20c5f6c6efd19c35f6',
        'page': page.toString(),
        'language': language,
      };

      final databaseResponse = await client
          .get(Uri.parse(baseUrl)
      , headers: {
            'Content-Type': 'Application/json',

          }).timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            // Closing client here throwns an error
            // client.close(); // Connection closed before full header was received
            return http.Response('Error', 500); // Replace 500 with your http code.
          },);

      if (databaseResponse.statusCode == 200) {
        final responseJson = databaseResponse.body;
        Map<String, dynamic> map = jsonDecode(responseJson);
        var serverResponse = ServerResponseModel.fromJson(map);
        final parsed = serverResponse.results;

        List<PopularPeopleEntity> posts = List<PopularPeopleEntity>.from(parsed.map((model)=> PopularPeopleModel.fromJson(model)));

        return posts;
      }else  if (databaseResponse.statusCode == 401 ||  databaseResponse.statusCode == 404 || databaseResponse.statusCode == 500){
        final responseJson = databaseResponse.body;
        Map<String, dynamic> map = jsonDecode(responseJson);
        var errorResponse = ErrorResponseModel.fromJson(map);
        throw ServerException(errorResponse.statusMessage!);
      }

      else{
        throw ServerException('Un Known Response Code');
      }

    }on http.ClientException catch (e) {
      throw ServerException(e.message);
    }on HttpException catch (e){
      throw ServerException(e.message);
    }on CheckedFromJsonException catch (e){
      throw ServerException(e.message!);
    }on Exception catch (e){
      throw ServerException(e.runtimeType.toString());
    } /*finally {
      client.close();
    }*/
  }

}