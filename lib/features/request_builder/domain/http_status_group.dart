enum HttpStatusGroup {
  success,
  redirect,
  clientError,
  serverError,
  unknown,
}

HttpStatusGroup statusGroupFromCode(int? code) {
  if (code == null) return HttpStatusGroup.unknown;
  if (code >= 200 && code < 300) return HttpStatusGroup.success;
  if (code >= 300 && code < 400) return HttpStatusGroup.redirect;
  if (code >= 400 && code < 500) return HttpStatusGroup.clientError;
  if (code >= 500 && code < 600) return HttpStatusGroup.serverError;
  return HttpStatusGroup.unknown;
}
