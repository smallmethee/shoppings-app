import 'package:flutter_test/flutter_test.dart';
import 'package:shoppings_app/domain/entities/orders/user_order.dart';
import 'package:shoppings_app/domain/usecases/orders/order_summary.dart';

void main() {
  late CalculateOrderSummary useCase;

  setUp(() {
    useCase = CalculateOrderSummary();
  });

  group('CalculateOrderSummary - คำนวณราคาสั่งซื้อ', () {
    test('เมื่อไม่มีสินค้าสั่งซื้อ ควรคืนค่ายอดรวมทั้งหมดเป็น 0', () {
      final orders = <UserOrder>[];
      final result = useCase.execute(orders);

      expect(result.subtotal, 0);
      expect(result.discount, 0);
      expect(result.total, 0);
    });

    test('เมื่อมีสินค้า 1 รายการ และไม่มีส่วนลด', () {
      final orders = [
        UserOrder(productId: 1, quantity: 1, price: 100, name: 'Product A'),
      ];
      final result = useCase.execute(orders);

      expect(result.subtotal, 100);
      expect(result.discount, 0);
      expect(result.total, 100);
    });

    test('เมื่อมีสินค้า 2 ชิ้น (1 คู่) ควรได้รับส่วนลด 5%', () {
      final orders = [
        UserOrder(productId: 1, quantity: 2, price: 200, name: 'Product A'),
      ];
      final result = useCase.execute(orders);

      expect(result.subtotal, 400);
      expect(result.discount, 20); // (200*2) * 0.05 = 20
      expect(result.total, 380);
    });

    test('เมื่อมีสินค้า 3 ชิ้น (1 คู่ + 1 ชิ้น) ควรคำนวณส่วนลดถูกต้อง', () {
      final orders = [
        UserOrder(productId: 1, quantity: 3, price: 150, name: 'Product A'),
      ];
      final result = useCase.execute(orders);

      expect(result.subtotal, 450); // (150*3) = 450
      expect(result.discount, 15); // ส่วนลดจาก 1 คู่ (150*2*0.05) = 15
      expect(result.total, 435);
    });

    test('เมื่อมีสินค้า 4 ชิ้น (2 คู่) ควรคำนวณส่วนลดถูกต้อง', () {
      final orders = [
        UserOrder(productId: 1, quantity: 4, price: 100, name: 'Product B'),
      ];
      final result = useCase.execute(orders);

      expect(result.subtotal, 400); // 100 * 4 = 400
      expect(result.discount, 20); // (100*2*0.05) * 2 = 20
      expect(result.total, 380);
    });

    test('เมื่อมีสินค้าหลายรายการ ควรคำนวณยอดรวมและส่วนลดถูกต้อง', () {
      final orders = [
        UserOrder(productId: 1, quantity: 3, price: 200, name: 'Product A'),
        UserOrder(productId: 2, quantity: 4, price: 150, name: 'Product B'),
        UserOrder(productId: 3, quantity: 1, price: 100, name: 'Product C'),
      ];
      final result = useCase.execute(orders);

      expect(result.subtotal, 1300); // (200*3) + (150*4) + (100*1) = 1300
      expect(result.discount, 50); // (200*2*0.05) + (150*2*0.05)*2 = 50
      expect(result.total, 1250); // 1300 - 50 = 1250
    });

    test('เมื่อมีสินค้า 5 ชิ้น (2 คู่ + 1 ชิ้น) ควรคำนวณส่วนลดถูกต้อง', () {
      final orders = [
        UserOrder(productId: 1, quantity: 5, price: 120, name: 'Product D'),
      ];
      final result = useCase.execute(orders);

      expect(result.subtotal, 600); // 120 * 5 = 600
      expect(result.discount, 24); // (120*2*0.05) * 2 = 24
      expect(result.total, 576);
    });
  });
}
