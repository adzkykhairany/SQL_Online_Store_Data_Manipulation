USE ABCOnlineShop;

-- Tampilkan 2 barang termahal yang dibuat oleh toko onilne ABC

SELECT * FROM MsProduct
ORDER BY Price DESC
LIMIT 2;

/*	Tampilkan detail toko yang sudah official diurutkan dari nama pemilik toko terbesar [A - Z].
	Tidak boleh menggunakan kolom isOfficial. Gunakan kolom IDShop digit terakhir.
	Jika digit terakhir adalah "Y" maka toko tersebut official, jika "N" maka non-official.	*/

SELECT * FROM TrShop
WHERE RIGHT (IDShop,1) = 'Y'
ORDER BY Owner DESC;

/*	Buatlah view bernama 'vw_CreditCardDoneTransaction' yang menampilkan detail 
	transaksi yang sudah selesai dan menggunakan Credit Card */

CREATE VIEW vw_CreditCardDoneTransaction
AS SELECT * FROM TrTransaction
WHERE Done = 1 AND PaymentMethod = 'Credit Card';

SELECT * FROM vw_CreditCardDoneTransaction;

-- Tampilkan nama pemilik toko OFFICIAL dengan format [kode toko + pemilik toko]

SELECT CONCAT(IDShop, ' ', SUBSTR(Owner, LOCATE(' ', Owner), LENGTH(Owner))) -- Locate dari spasi sampai nama panjang owner
AS 'Owner Name	'
FROM TrShop
WHERE isOfficial = 1;

/*	Tampilkan kode produk, nama produk, stok produk, pirce dengan format ['Rp. ' + Price] 
	dari product yang memiliki stock lebih dari 50 */

SELECT IDProduct, ProductName, Stock,
CONCAT('Rp. ', Price) AS Price
FROM MsProduct
WHERE Stock > 50;

/*	Tampilkan kode toko, nama toko dengan format nama_toko + official/non-official, 
	owner, alamat yang memiliki harga lebih dari 100000 */

SELECT DISTINCT
	a.IDShop, 
    CONCAT(ShopName, CASE WHEN isOfficial = 1 THEN ' (Official)' ELSE ' (non-Official)' END) AS ShopName,
    Owner, 
    Address
FROM TrShop a
JOIN MsProduct b ON a.IDShop = b.IDShop
WHERE Price > 100000;

/*	Tampilkan kode transaksi, kode product, kode customer, transaction date dengan format dd mm yyyy,
	qty, total price, payment method dari transaksi yang terjadi dibulan September dan November */
    
SELECT 
	IDTransaction, 
    IDProduct, 
    IDCustomer,
    DATE_FORMAT(TransactionDate, '%d %M %Y') AS TransactionDate,
    TotalPrice,
    PaymentMethod
FROM TrTransaction
WHERE MONTH(TransactionDate) = 9 OR MONTH(TransactionDate) = 11;

/*	Tampilkan nama metode transaksi, jumlah transaksi yang menggunakan metode
	debit (Payment Count) dari toko yang sudah official */

SELECT PaymentMethod, COUNT(PaymentMethod) AS 'Payment Count'
FROM TrTransaction a
JOIN MsProduct b ON a.IDProduct = b.idProduct
WHERE RIGHT (b.IDShop,1) = 'Y' AND PaymentMethod = 'Debit'
GROUP BY PaymentMethod;

/*	Tampilkan kode customer, nama customer, PhoneNumber, dan email
	yang memiliki nama dengan minimal 3 kata*/

SELECT * FROM TrCustomer
WHERE CustomerName LIKE '% % %';

/*	Buatlah Stored Procedure yang bernama 'Search_Product' yang menerima input/parameter
	nama barang, dan menampilkan nama toko yang menjual barang tersebut, kode barang,
    nama barang, stock, harga */
	
DELIMITER $$
CREATE PROCEDURE Search_Product(input VARCHAR(255))
BEGIN
	SELECT a.ShopName, b.IDProduct, b.ProductName, b.Stock, b.Price
    FROM TrShop a
    JOIN MsProduct b ON a.IDShop = b.IDShop
    WHERE b.ProductName = input;
END $$
DELIMITER ;

CALL Search_Product('Tooth Brush');

/*	Buatlah Stored Procedure bernama 'GetAverageReviewByProductName' yang menerima inputan/parameter
	nama product, yang berfungsi untuk menampilkan nama product, rata2 review star dari
	nama barang yang diinput */
    
DELIMITER !
CREATE PROCEDURE GetAverageReviewByProductName(input VARCHAR(255))
BEGIN
	SELECT a.ProductName, AVG(b.Star) AS 'Average Star'
    FROM MsProduct a
    JOIN TrReview b ON a.IDProduct = b.IDProduct
    WHERE a.ProductName = input
    GROUP BY a.ProductName;
END !
DELIMITER ;

CALL GetAverageReviewByProductName('Tooth Brush');

DELIMITER $$
CREATE PROCEDURE GetAverageReviewByProductName(IN Input_param VARCHAR(255))
BEGIN
    SELECT b.ProductName as 'Product Name', AVG(a.Star) as 'Average Review Star'
    FROM TrReview a
    JOIN MsProduct b ON a.IDProduct = b.IDProduct
    WHERE b.ProductName = Input_param
    GROUP BY b.ProductName;
END $$
DELIMITER ;

CALL GetAverageReviewByProductName ('Fidget Box');

SELECT * FROM msproduct;
SELECT * FROM trreview WHERE idproduct = 2;

/*	Buatlah Stored Procedure bernama 'Search_Shop', menerima inputan/parameter
	nama toko ATAU nama owner yang berfungsi untuk menampilkan data toko sesuai dengan
	toko/owner yang diinput*/
    
DELIMITER !
CREATE PROCEDURE Search_Shop(input VARCHAR(255))
BEGIN
	SELECT * FROM TrShop
    WHERE 
		ShopName LIKE CONCAT('%', input, '%') OR 
		Owner LIKE CONCAT('%', input, '%');
END !
DELIMITER ;

SELECT * FROM TrShop;

CALL Search_Shop('In');
CALL Search_Shop('Par');

/*	Buatlah Stored Procedure yang bernama 'GetTotalStockAndSoldProduct', tidak menerima input/parameter
	yang berfungsi untuk menampilkan seluruh detail product dan 
	[Total Stock + Sold] = total stock product + jumlah product tersebut yang telah dijual*/

DELIMITER @
CREATE PROCEDURE GetTotalStockAndSoldProduct()
BEGIN
	SELECT a.IDProduct, a.IDShop, a.ProductName, a.Stock, a.Price, COALESCE(SUM(a.Stock + b.Qty), 0) AS 'Total Stock + Sold'
    FROM MsProduct a
    JOIN TrTransaction b ON a.IDProduct = b.IDProduct
    GROUP BY IDProduct;
END @
DELIMITER ;

CALL GetTotalStockAndSoldProduct();

/*	Buatlah Stored Procedure dengan nama 'CountProductInCustomerCart' yang menerima parameter
	nama product, yang berfungsi untuk menampilkan nama product dan [Count Customer] = jumlah
	customer yang menyimpan product tersebut di cart customer */
    
DELIMITER % 
CREATE PROCEDURE CountProductInCustomerCart(input VARCHAR(255))
BEGIN
	SELECT b.ProductName, COALESCE(a.CountCustomer, 0) AS 'Count Customer'
    FROM (
		SELECT IDProduct, COUNT(IDCustomer) AS CountCustomer
        FROM TrCart 
        GROUP BY IDProduct
	) a
    RIGHT JOIN MsProduct b ON a.IDProduct = b.IDProduct
    WHERE b.ProductName = input;
END%
DELIMITER ;

SELECT * FROM MsProduct;

CALL CountProductInCustomerCart('Lego');

/*	Buatlah Stored Procedure yang bernama 'CalculateCustomerPoint' yang menerima input/parameter
	nama customer, yang berfungsi untuk memberikan poin kepada customer yang telah
    menghabiskan uang untuk berbelanja dengan ketentuan berikut
    Note :	1. apabila customer menghabiskan < Rp. 100,000 -> mendapat poin 0
			2. apabila customer menghabiskan Rp. 100,000 - Rp. 499,000 -> mendapat poin 20
			3. apabila customer menghabiskan Rp. 500,000 - Rp. 999,000 -> mendapat poin 50
            4. apabila customer menghabiskan > Rp. 1,000,000-> mendapat poin 100 */
            
DELIMITER *
CREATE PROCEDURE CalculateCustomerPoint(input VARCHAR(255))
BEGIN
	DECLARE Total_Spending BIGINT;
    SET Total_Spending = (
		SELECT SUM(TotalPrice) 
        FROM TrTransaction a 
        JOIN TrCustomer b 
		ON a.IDCustomer = b.IDCustomer 
        WHERE CustomerName = input 
        GROUP BY a.IDCustomer
	);
	SELECT CASE
		WHEN Total_Spending < 100000 OR Total_Spending IS NULL THEN 0
		WHEN Total_Spending >= 100000 AND Total_Spending < 500000 THEN 20
		WHEN Total_Spending >= 500000 AND Total_Spending < 1000000 THEN 50 -- <= 999999
		ELSE 100
	END AS Point;
END *
DELIMITER ;

CALL CalculateCustomerPoint('Christiana Willis Cockle');