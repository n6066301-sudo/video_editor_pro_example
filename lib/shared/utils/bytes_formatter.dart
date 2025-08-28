import 'dart:math';

/// Formats a given number of bytes into a human-readable string with
/// appropriate size units (e.g., B, KB, MB, GB, TB).
///
/// The function converts the input `bytes` into a string representation with
/// the specified number of decimal places, defaulting to 2.
///
/// - Parameters:
///   - bytes: The size in bytes to be formatted. Must be a non-negative
///     integer.
///   - decimals: The number of decimal places to include in the formatted
///     output. Defaults to 2.
///
/// - Returns:
///   A string representing the formatted size with the appropriate unit.
///
/// - Example:
///   ```dart
///   formatBytes(1024); // Returns "1.00 KB"
///   formatBytes(1048576, 1); // Returns "1.0 MB"
///   formatBytes(0); // Returns "0 B"
///   ```
String formatBytes(int bytes, [int decimals = 2]) {
  if (bytes <= 0) return '0 B';
  const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
  int i = (log(bytes) / log(1024)).floor();
  double size = bytes / pow(1024, i);
  return '${size.toStringAsFixed(decimals)} ${suffixes[i]}';
}
