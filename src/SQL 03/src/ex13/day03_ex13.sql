/* Напишите 2 оператора SQL (DML), которые удаляют все новые заказы из упражнения #12 на основе даты заказа.
   Затем удалите из меню «греческую пиццу». */

DELETE FROM person_order
WHERE order_date='2022-02-25';

DELETE FROM menu
WHERE pizza_name = 'greek pizza';
