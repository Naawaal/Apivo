enum LogLevel {
  debug(0),
  info(1),
  warning(2),
  error(3);

  const LogLevel(this.priority);
  final int priority;
}
