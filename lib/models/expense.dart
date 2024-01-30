import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Creating a constant instance of Uuid
const uuid = Uuid();

/// A date formatter for formatting dates in year-month-day format.
final formatter = DateFormat.yMd();

/// An enumeration representing different categories of expenses.
enum Category { food, travel, leisure, bills, work }

/// A map linking each [Category] to a corresponding Material Design icon.
const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.beach_access,
  Category.bills: Icons.receipt,
  Category.work: Icons.work,
};

/// A class representing an expense.
///
/// Each expense has a unique identifier, a title, an amount, a date, and a category.
/// The unique identifier is automatically generated upon creation of an expense.
class Expense {
  /// Creates a new expense.
  ///
  /// Requires a [title], an [amount], a [date], and a [category].
  /// Automatically generates a unique identifier [id] for the expense.
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  /// Returns the date of the expense in a formatted string.
  ///
  /// The date is formatted as year-month-day.
  String get formattedDate {
    return formatter.format(date);
  }
}
