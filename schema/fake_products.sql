USE laptopvn;

-- Xóa dữ liệu cũ (tuỳ chọn - bỏ comment nếu muốn xóa trước khi insert)
-- DELETE FROM products;

INSERT INTO
    products (
        name,
        price,
        image,
        detail_desc,
        short_desc,
        quantity,
        sold,
        factory,
        target
    )
VALUES
    -- Apple MacBook
    (
        'MacBook Air M2 2024',
        27990000,
        'macbook-air-m2.jpg',
        'MacBook Air M2 2024 sở hữu chip Apple M2 mạnh mẽ, màn hình Liquid Retina 13.6 inch, RAM 8GB, SSD 256GB. Thiết kế siêu mỏng nhẹ, pin lên đến 18 giờ sử dụng. Phù hợp cho công việc văn phòng, học tập và giải trí.',
        'Laptop Apple MacBook Air M2 - 8GB RAM - 256GB SSD - Màn hình 13.6 inch',
        50,
        12,
        'Apple',
        'Student'
    ),
    (
        'MacBook Pro 14 M3 Pro',
        49990000,
        'macbook-pro-14.jpg',
        'MacBook Pro 14 inch trang bị chip M3 Pro với 12 nhân CPU và 18 nhân GPU. RAM 18GB, SSD 512GB. Màn hình Liquid Retina XDR siêu sáng, hệ thống 6 loa chất lượng cao. Hiệu năng vượt trội cho công việc sáng tạo chuyên nghiệp.',
        'Laptop Apple MacBook Pro 14 M3 Pro - 18GB RAM - 512GB SSD',
        30,
        8,
        'Apple',
        'Office'
    ),

-- Dell
(
    'Dell XPS 15 9530',
    35990000,
    'dell-xps-15.jpg',
    'Dell XPS 15 9530 với CPU Intel Core i7-13700H, RAM 16GB DDR5, SSD 512GB. Màn hình OLED 3.5K 15.6 inch tuyệt đẹp, viền siêu mỏng InfinityEdge. Vỏ nhôm CNC cao cấp, bàn phím có đèn nền. Lý tưởng cho designer và lập trình viên.',
    'Laptop Dell XPS 15 - Core i7-13700H - 16GB RAM - 512GB SSD - OLED 3.5K',
    25,
    5,
    'Dell',
    'Office'
),
(
    'Dell Inspiron 15 3530',
    15990000,
    'dell-inspiron-15.jpg',
    'Dell Inspiron 15 3530 trang bị CPU Intel Core i5-1335U, RAM 8GB DDR4, SSD 256GB. Màn hình 15.6 inch Full HD chống lóa. Thiết kế gọn nhẹ, bàn phím full-size tiện dụng. Phù hợp cho nhu cầu học tập và làm việc cơ bản.',
    'Laptop Dell Inspiron 15 - Core i5-1335U - 8GB RAM - 256GB SSD',
    60,
    20,
    'Dell',
    'Student'
),

-- Lenovo
(
    'Lenovo ThinkPad X1 Carbon Gen 11',
    42990000,
    'thinkpad-x1-carbon.jpg',
    'ThinkPad X1 Carbon Gen 11 - biểu tượng laptop doanh nhân. CPU Intel Core i7-1365U vPro, RAM 16GB, SSD 512GB. Màn hình 14 inch 2.8K OLED, trọng lượng chỉ 1.12kg. Đạt chuẩn quân sự MIL-STD-810H, bảo mật vân tay và IR camera.',
    'Laptop Lenovo ThinkPad X1 Carbon Gen 11 - Core i7 vPro - 16GB - 512GB',
    20,
    7,
    'Lenovo',
    'Office'
),
(
    'Lenovo IdeaPad Slim 5 14',
    16990000,
    'lenovo-ideapad-5.jpg',
    'Lenovo IdeaPad Slim 5 14 với AMD Ryzen 5 7530U, RAM 8GB DDR4, SSD 512GB. Màn hình 14 inch Full HD IPS chống lóa, độ sáng 300 nits. Thiết kế mỏng nhẹ 1.39kg, pin 12 giờ. Lựa chọn tốt cho sinh viên và nhân viên văn phòng.',
    'Laptop Lenovo IdeaPad Slim 5 - Ryzen 5 7530U - 8GB RAM - 512GB SSD',
    45,
    15,
    'Lenovo',
    'Student'
),

-- ASUS
(
    'ASUS ROG Strix G16 2024',
    38990000,
    'asus-rog-strix-g16.jpg',
    'ASUS ROG Strix G16 - laptop gaming hiệu năng cao. CPU Intel Core i9-14900HX, GPU NVIDIA RTX 4070 8GB. RAM 16GB DDR5, SSD 1TB. Màn hình 16 inch QHD+ 240Hz, hệ thống tản nhiệt ROG Intelligent Cooling. Bàn phím RGB per-key.',
    'Laptop ASUS ROG Strix G16 - Core i9-14900HX - RTX 4070 - 16GB - 1TB',
    15,
    6,
    'Asus',
    'Gaming'
),
(
    'ASUS VivoBook 15 OLED',
    18990000,
    'asus-vivobook-15.jpg',
    'ASUS VivoBook 15 OLED sở hữu màn hình Samsung OLED 15.6 inch Full HD, hiển thị màu sắc rực rỡ. CPU Intel Core i5-13500H, RAM 16GB, SSD 512GB. Thiết kế trẻ trung nhiều màu sắc, bản lề 180 độ. Phù hợp sinh viên sáng tạo.',
    'Laptop ASUS VivoBook 15 OLED - Core i5-13500H - 16GB RAM - 512GB SSD',
    40,
    18,
    'Asus',
    'Student'
),
(
    'ASUS TUF Gaming F15 2024',
    25990000,
    'asus-tuf-f15.jpg',
    'ASUS TUF Gaming F15 - laptop gaming bền bỉ đạt chuẩn quân sự. CPU Intel Core i7-14650HX, GPU NVIDIA RTX 4060 8GB. RAM 16GB DDR5, SSD 512GB. Màn hình 15.6 inch FHD 144Hz. Tản nhiệt Arc Flow Fan, pin 90Wh cho gaming di động.',
    'Laptop ASUS TUF Gaming F15 - Core i7-14650HX - RTX 4060 - 16GB - 512GB',
    35,
    10,
    'Asus',
    'Gaming'
),

-- HP
(
    'HP Pavilion 15 eg3000',
    19990000,
    'hp-pavilion-15.jpg',
    'HP Pavilion 15 với thiết kế sang trọng, CPU Intel Core i7-1355U, RAM 16GB DDR4, SSD 512GB. Màn hình 15.6 inch Full HD IPS micro-edge. Loa B&O dual speakers, webcam HP True Vision 720p. Phù hợp cho công việc và giải trí đa phương tiện.',
    'Laptop HP Pavilion 15 - Core i7-1355U - 16GB RAM - 512GB SSD',
    30,
    9,
    'HP',
    'Office'
),
(
    'HP Victus 16 2024',
    23990000,
    'hp-victus-16.jpg',
    'HP Victus 16 - laptop gaming giá tốt. CPU AMD Ryzen 7 7840HS, GPU NVIDIA RTX 4060 8GB. RAM 16GB DDR5, SSD 512GB. Màn hình 16.1 inch FHD 144Hz. Hệ thống tản nhiệt Tempest Cooling, thiết kế hiện đại với đèn LED halo trắng.',
    'Laptop HP Victus 16 - Ryzen 7 7840HS - RTX 4060 - 16GB - 512GB',
    25,
    4,
    'HP',
    'Gaming'
),

-- MSI
(
    'MSI GF63 Thin 12VE',
    21990000,
    'msi-gf63.jpg',
    'MSI GF63 Thin - laptop gaming mỏng nhẹ. CPU Intel Core i5-12450H, GPU NVIDIA RTX 4050 6GB. RAM 8GB DDR4, SSD 512GB. Màn hình 15.6 inch FHD 144Hz. Bàn phím đỏ backlit, Cooler Boost 5, Nahimic Audio. Gaming entry-level tuyệt vời.',
    'Laptop MSI GF63 Thin - Core i5-12450H - RTX 4050 - 8GB - 512GB',
    40,
    14,
    'MSI',
    'Gaming'
),
(
    'MSI Creator Z16 HX Studio',
    55990000,
    'msi-creator-z16.jpg',
    'MSI Creator Z16 HX Studio - laptop sáng tạo cao cấp. CPU Intel Core i9-13950HX, GPU NVIDIA RTX 4070 8GB. RAM 32GB DDR5, SSD 1TB. Màn hình QHD+ 16 inch Mini LED 120Hz, chuẩn màu Delta E<2. Phục vụ 3D rendering, video editing chuyên nghiệp.',
    'Laptop MSI Creator Z16 - Core i9-13950HX - RTX 4070 - 32GB - 1TB',
    10,
    2,
    'MSI',
    'Office'
),

-- Acer
(
    'Acer Nitro V 15 ANV15-51',
    22990000,
    'acer-nitro-v15.jpg',
    'Acer Nitro V 15 - laptop gaming mới nhất từ Acer. CPU Intel Core i5-13420H, GPU NVIDIA RTX 4050 6GB. RAM 16GB DDR5, SSD 512GB. Màn hình 15.6 inch FHD 144Hz IPS. Dual fan cooling, 4 vùng RGB keyboard. Hiệu năng gaming tốt trong tầm giá.',
    'Laptop Acer Nitro V 15 - Core i5-13420H - RTX 4050 - 16GB - 512GB',
    35,
    11,
    'Acer',
    'Gaming'
),
(
    'Acer Swift Go 14 SFG14-73',
    24990000,
    'acer-swift-go-14.jpg',
    'Acer Swift Go 14 trang bị CPU Intel Core Ultra 7 155H (AI PC), RAM 16GB LPDDR5X, SSD 512GB. Màn hình 14 inch 2.8K OLED 90Hz, trọng lượng chỉ 1.3kg. Pin 65Wh sạc nhanh. Laptop AI-powered cho năng suất làm việc vượt trội.',
    'Laptop Acer Swift Go 14 - Core Ultra 7 155H - 16GB - 512GB - OLED 2.8K',
    20,
    3,
    'Acer',
    'Office'
);