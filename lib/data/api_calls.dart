import 'dart:io';

import 'package:dio/dio.dart';
import 'package:smart_investor_dick/data/shared_preferences_data.dart';
import '../utilities/snackbar_view.dart';
import 'api_foundation.dart';

// Assuming connectivityNotifier is defined somewhere globally or passed in.
// Example: final connectivityNotifier = ConnectivityNotifier();

class ApiCalls {
  late Dio _dio;
  ApiCalls()
      : _dio = Dio(BaseOptions(
    baseUrl: ApiFoundation.baseUrl(),
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  Future<void> initializeDio() async {
    final preference = SharedPreferencesData();
    var token = await preference.getAccessToken();
    print(token);

    _dio = Dio(BaseOptions(
      baseUrl: ApiFoundation.baseUrl(),
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // FIXED: Added 'Bearer ' prefix for the token
        'Authorization': 'Bearer $token',
      },
    ));
  }

  Future<Response> getMethod(String endpoint) async {
    try {
      await InternetAddress.lookup('google.com');
      try {
        Response response = await _dio.get(endpoint);
        if (response.statusCode == 401) {
          /// Logout and Redirect to Login Screen
          return response;
        } else {
          return response;
        }
      } on DioException catch (dioError) {
        if (dioError.response != null) {
          return dioError.response!;
        } else {
          // REMOVED SnackBarView calls from here
          if (dioError.type == DioExceptionType.connectionTimeout) {
            throw Exception("Connection timed out. Please try again.");
          } else if (dioError.type == DioExceptionType.receiveTimeout) {
            throw Exception("Request timed out. Please check your internet connection.");
          } else {
            throw Exception("Network error: ${dioError.message}");
          }
        }
      }
    } on SocketException catch (_) {
      // connectivityNotifier.setConnected(false);
      throw Exception("No internet connection.");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  Future<Response> postMethod(String endpoint, Map<String, dynamic> data) async {
    try {
      await InternetAddress.lookup('google.com');
      try {
        Response response = await _dio.post(endpoint, data: data);
        if (response.statusCode == 401) {
          /// Logout and Redirect to Login Screen
          return response;
        } else {
          return response;
        }
      } on DioException catch (dioError) {
        if (dioError.response != null) {
          return dioError.response!;
        } else {
          // REMOVED SnackBarView calls from here
          if (dioError.type == DioExceptionType.connectionTimeout) {
            throw Exception("Connection timed out. Please try again.");
          } else if (dioError.type == DioExceptionType.receiveTimeout) {
            throw Exception("Request timed out. Please check your internet connection.");
          } else {
            throw Exception("Network error: ${dioError.message}");
          }
        }
      }
    } on SocketException catch (_) {
      // connectivityNotifier.setConnected(false);
      throw Exception("No internet connection.");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  Future<Response> putMethod(String endpoint, Map<String, dynamic> data) async {
    try {
      await InternetAddress.lookup('google.com');
      try {
        Response response = await _dio.put(endpoint, data: data);
        if (response.statusCode == 401) {
          /// Logout logic here
          return response;
        } else {
          return response;
        }
      } on DioException catch (dioError) {
        if (dioError.response != null) {
          return dioError.response!;
        } else {
          // REMOVED SnackBarView calls from here
          if (dioError.type == DioExceptionType.connectionTimeout) {
            throw Exception("Connection timed out. Please try again.");
          } else if (dioError.type == DioExceptionType.receiveTimeout) {
            throw Exception("Request timed out. Please check your internet connection.");
          } else {
            throw Exception("Network error: ${dioError.message}");
          }
        }
      }
    } on SocketException catch (_) {
      // connectivityNotifier.setConnected(false);
      throw Exception("No internet connection.");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  Future<Response> deleteMethod(String endpoint, Map<String, dynamic> data) async {
    try {
      await InternetAddress.lookup('google.com');
      try {
        Response response = await _dio.delete(endpoint, data: data);
        if (response.statusCode == 401) {
          /// Logout logic here
          return response;
        } else {
          return response;
        }
      } on DioException catch (dioError) {
        if (dioError.response != null) {
          return dioError.response!;
        } else {
          // REMOVED SnackBarView calls from here
          if (dioError.type == DioExceptionType.connectionTimeout) {
            throw Exception("Connection timed out. Please try again.");
          } else if (dioError.type == DioExceptionType.receiveTimeout) {
            throw Exception("Request timed out. Please check your internet connection.");
          } else {
            throw Exception("Network error: ${dioError.message}");
          }
        }
      }
    } on SocketException catch (_) {
      // connectivityNotifier.setConnected(false);
      throw Exception("No internet connection.");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  Future<void> multiPartInitializeDio() async {
    final preference = SharedPreferencesData();
    var token = await preference.getAccessToken();
    print("token::: $token");
    _dio = Dio(BaseOptions(
      baseUrl: ApiFoundation.baseUrl(),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ));
  }

  Future<Response> multipartPostMethod(String endpoint, FormData data) async {
    try {
      await InternetAddress.lookup('google.com');
      try {
        Response response = await _dio.post(endpoint, data: data);
        if (response.statusCode == 401) {
          /// Logout logic here
          return response;
        } else {
          return response;
        }
      } on DioException catch (dioError) {
        if (dioError.response != null) {
          return dioError.response!;
        } else {
          // REMOVED SnackBarView calls from here
          if (dioError.type == DioExceptionType.connectionTimeout) {
            throw Exception("Connection timed out. Please try again.");
          } else if (dioError.type == DioExceptionType.receiveTimeout) {
            throw Exception("Request timed out. Please check your internet connection.");
          } else {
            throw Exception("Network error: ${dioError.message}");
          }
        }
      }
    } on SocketException catch (_) {
      // connectivityNotifier.setConnected(false);
      throw Exception("No internet connection.");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  Future<Response> multipartPatchMethod(String endpoint, FormData data) async {
    try {
      await InternetAddress.lookup('google.com');
      try {
        Response response = await _dio.patch(endpoint, data: data);
        if (response.statusCode == 401) {
          /// Logout logic here
          return response;
        } else {
          return response;
        }
      } on DioException catch (dioError) {
        if (dioError.response != null) {
          return dioError.response!;
        } else {
          // REMOVED SnackBarView calls from here
          if (dioError.type == DioExceptionType.connectionTimeout) {
            throw Exception("Connection timed out. Please try again.");
          } else if (dioError.type == DioExceptionType.receiveTimeout) {
            throw Exception("Request timed out. Please check your internet connection.");
          } else {
            throw Exception("Network error: ${dioError.message}");
          }
        }
      }
    } on SocketException catch (_) {
      // connectivityNotifier.setConnected(false);
      throw Exception("No internet connection.");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  Future<Response> patchMethod(String endpoint, Map<String, dynamic> data) async {
    try {
      await InternetAddress.lookup('google.com');
      try {
        Response response = await _dio.patch(endpoint, data: data);
        if (response.statusCode == 401) {
          /// Logout logic here
          return response;
        } else {
          return response;
        }
      } on DioException catch (dioError) {
        if (dioError.response != null) {
          return dioError.response!;
        } else {
          // REMOVED SnackBarView calls from here
          if (dioError.type == DioExceptionType.connectionTimeout) {
            throw Exception("Connection timed out. Please try again.");
          } else if (dioError.type == DioExceptionType.receiveTimeout) {
            throw Exception("Request timed out. Please check your internet connection.");
          } else {
            throw Exception("Network error: ${dioError.message}");
          }
        }
      }
    } on SocketException catch (_) {
      // connectivityNotifier.setConnected(false);
      throw Exception("No internet connection.");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }
}