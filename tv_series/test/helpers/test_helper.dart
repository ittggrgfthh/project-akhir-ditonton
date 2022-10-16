import 'package:tv_series/data/datasources/db/database_helper_tv.dart';
import 'package:tv_series/data/datasources/tv_local_data_source.dart';
import 'package:tv_series/data/datasources/tv_remote_data_source.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/io_client.dart';

@GenerateMocks([
  TVRepository,
  TVSeriesRemoteDataSource,
  TVLocalDataSource,
  DatabaseHelperTV,
], customMocks: [
  MockSpec<IOClient>(as: #MockHttpClient)
])
void main() {}
