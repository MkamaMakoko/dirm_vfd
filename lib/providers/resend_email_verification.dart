part of '_.dart';

@riverpod
Future<bool> resendVerification(ResendVerificationRef ref,
    {required String email}) async {
  final token =
      await ref.watch(userProvider.selectAsync((value) => value?.token));
  final response = await _post(
          endpoint: 'registration/resend_email_confirmation_link',
          body: {'emailAddress': email},
          token: token)
      .then((value) => _response(value));
  return response.bodyStatusCode == 200;
}
