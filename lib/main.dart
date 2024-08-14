class $<T, U> implements Type {
  final dynamic t1;
  final dynamic t2;
  final dynamic t3;
  final dynamic t4;
  final dynamic t5;
  final dynamic t6;
  final dynamic t7;
  final dynamic t8;
  final dynamic t9;
  final dynamic t10;
  final dynamic t11;
  final dynamic t12;
  final dynamic t13;
  final dynamic t14;
  final dynamic t15;
  final dynamic t16;
  final dynamic t17;
  final dynamic t18;
  final dynamic t19;
  final dynamic t20;
  final dynamic t21;
  final dynamic t22;
  final dynamic t23;
  final dynamic t24;
  final dynamic t25;
  final dynamic t26;
  final dynamic t27;
  final dynamic t28;
  final dynamic t29;
  final dynamic t30;
  final dynamic t31;
  final dynamic t32;
  final dynamic t33;
  final dynamic t34;
  final dynamic t35;
  final dynamic t36;
  final dynamic t37;
  final dynamic t38;
  final dynamic t39;
  final dynamic t40;
  final dynamic t41;
  final dynamic t42;
  final dynamic t43;
  final dynamic t44;
  final dynamic t45;
  final dynamic t46;
  final dynamic t47;
  final dynamic t48;
  final dynamic t49;
  final dynamic t50;
  const $([
    this.t1,
    this.t2,
    this.t3,
    this.t4,
    this.t5,
    this.t6,
    this.t7,
    this.t8,
    this.t9,
    this.t10,
    this.t11,
    this.t12,
    this.t13,
    this.t14,
    this.t15,
    this.t16,
    this.t17,
    this.t18,
    this.t19,
    this.t20,
    this.t21,
    this.t22,
    this.t23,
    this.t24,
    this.t25,
    this.t26,
    this.t27,
    this.t28,
    this.t29,
    this.t30,
    this.t31,
    this.t32,
    this.t33,
    this.t34,
    this.t35,
    this.t36,
    this.t37,
    this.t38,
    this.t39,
    this.t40,
    this.t41,
    this.t42,
    this.t43,
    this.t44,
    this.t45,
    this.t46,
    this.t47,
    this.t48,
    this.t49,
    this.t50,
  ]);
}

class User {
  void methodOne2(@$(int, Map<List<int?>, int>, List<Map<int, int>>) abcd) =>
      null;
}

void main() {
  final jack = User();
  List<Map<int, int>> ertret = [];
  List<Map<int, String>> ertret2 = [];
  // The above declaration also survived a List<SomeOutOfContextInterfaceForTesting> param for methodOne2
  // and it recognizes "dynamic" and "Object?" that are instrumental for the annotation union type solution.
  jack.methodOne2(ertret); // valid - blue underscore
  jack.methodOne2(ertret2); // invalid - red underscore
  // Some earlier examples
  jack.methodOne2(19); // valid - blue underscore
  jack.methodOne2('Oh no, String is not allowed'); // invalid - red underscore
}
