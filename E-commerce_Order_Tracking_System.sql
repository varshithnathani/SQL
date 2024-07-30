SQL> -- creating customer table
SQL>
SQL> create table customers(customerId int, name varchar(20), email varchar2(20), Address varchar2(30), phone number(10), constraint customers_customerId_pk primary key(customerId));

Table created.

SQL>
SQL> -- creating product table
SQL> create table products(productId int, name varchar(50), description varchar2(225), price decimal(10,2), stockquality int, constra
int products_productid_pk primary key(productId));

Table created.

SQL>
SQL> -- creating order table
SQL>
SQL> create table orders(OrderId int, customerId int, orderdate date, totalamount decimal(10,2), orderstatus varchar2(70), constraint orders_orderId_pk primary key(orderId), constraint orders_customerId_fk foreign key(customerId) references customers(customerId));

Table created.

SQL>
SQL> -- creatinf orderdetails table
SQL>
SQL> create table orderDetails(OrderDetailId int, OrderId int, ProductId int, Quantity int, price decimal(10,3), constraint OrderDetails_OrederDetailId_pk primary key(orderDetailId), constraint orderdetails_OrderId_fk foreign key(orderId) references orders(OrderId),

  2   constraint Orderdetails_productId_fk foreign key(productId) references products(productId));

Table created.

SQL> -- creating shipment details
SQL> create table shipments(
  2      shipmentId int,
  3      orderId int,
  4      shipmentDate date,
  5      carrier varchar2(100),
  6      trackingNumber varchar2(100),
  7      constraint shipments_shipmentId_pk primary key(shipmentId),
  8      constraint shipments_OrderId_fk foreign key(orderId) references orders(OrderId));

Table created.

SQL> -- creating deliveries table
SQL> create table deliveries(
  2      deliveryid int,
  3      shipmentId int,
  4      DeliveryDate date,
  5      deliveryStatus varchar2(100),
  6      constraint deliveries_deliveryId_pk primary key(deliveryId),
  7      constraint deliveries_shipmentId_fk foreign key(shipmentId) references shipments(shipmentId));

Table created.
SQL>
SQL> -- Inserting customer data
SQL>
SQL> insert into customers values(001,'Nathani Varshith','ecommerce@gmail.com','103- SR Residence',9000080000);

1 row created.

SQL>
SQL> -- inserting product data
SQL>
SQL> insert into products values(001,'Android','New Model',20000.00,15);

1 row created.

SQL> insert into products values(002,'Laptop','High Specs New Laptop',70000.00,120);

1 row created.

SQL>
SQL>
SQL> -- inserting order details
SQL>
SQL> insert into orders values(001,001, sysdate,90000.00,'Started');

1 row created.

SQL>
SQL> -- inserting orderDetails data
SQL>
SQL> insert into orderDetails values(001,001,001,001,20000.00);

1 row created.

SQL> insert into orderDetails values(002,001,002,001,70000.00);

1 row created.

SQL>
SQL>
SQL> -- inserting shipment data
SQL>
SQL> insert into shipments values(001,001,sysdate,'BluedartAB','Track0010');

1 row created.

SQL>
SQL> -- inserting into deliveries values(001,001, sysdate+2, 'Delivered');
SQL>
SQL> insert into deliveries values(001,001,sysdate+2,'delivered');

1 row created.

SQL>
SQL> set linesize 300;
SQL> select * from customers;

CUSTOMERID NAME                 EMAIL                ADDRESS                             PHONE
---------- -------------------- -------------------- ------------------------------ ----------
         1 Nathani Varshith     ecommerce@gmail.com  103- SR Residence              9000080000

SQL> select * from products;

 PRODUCTID NAME                                               DESCRIPTION
    PRICE
---------- -------------------------------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------
STOCKQUALITY
------------
         1 Android                                            New Model
    20000
          15

         2 Laptop                                             High Specs New Laptop
    70000
         120


SQL> select * from orders;

   ORDERID CUSTOMERID ORDERDATE TOTALAMOUNT ORDERSTATUS
---------- ---------- --------- ----------- ----------------------------------------------------------------------
         1          1 30-JUL-24       90000 Started

SQL> select * from orderdetails;

ORDERDETAILID    ORDERID  PRODUCTID   QUANTITY      PRICE
------------- ---------- ---------- ---------- ----------
            1          1          1          1      20000
            2          1          2          1      70000

SQL> select * from shipments;

SHIPMENTID    ORDERID SHIPMENTD CARRIER
TRACKINGNUMBER
---------- ---------- --------- ---------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------
         1          1 30-JUL-24 BluedartAB
Track0010

SQL> select * from deliveries;

DELIVERYID SHIPMENTID DELIVERYD DELIVERYSTATUS
---------- ---------- --------- ----------------------------------------------------------------------------------------------------
         1          1 01-AUG-24 delivered

SQL> -- delivered items status using joins
SQL> select orders.orderId, customers.name, orders.totalAmount, deliveries.deliverydate
  2  from orders, customers, shipments, deliveries
  3  where orders.customerId = customers.customerId and orders.orderId = shipments.orderId and shipments.shipmentId = deliveries.shipmentId and deliveries.deliverystatus = 'delivered';

   ORDERID NAME                 TOTALAMOUNT DELIVERYD
---------- -------------------- ----------- ---------
         1 Nathani Varshith           90000 01-AUG-24

SQL>
