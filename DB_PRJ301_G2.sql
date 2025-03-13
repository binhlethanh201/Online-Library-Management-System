USE master;
GO
CREATE DATABASE DB_PRJ301_G2_Offical;
GO
USE DB_PRJ301_G2_Offical;
GO

CREATE TABLE Category(
    CategoryID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(200) NOT NULL
);
CREATE TABLE Publisher(
    PublisherID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    PublisherName NVARCHAR(200) NOT NULL,
    Address NVARCHAR(200) NOT NULL,
    Website VARCHAR(200) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL UNIQUE
);
CREATE TABLE Book(
    BookID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    BookName NVARCHAR(100) NOT NULL,
    Images VARCHAR(500),
    Author NVARCHAR(100) NOT NULL,
    PublisherID INT NOT NULL,
    CategoryID INT NOT NULL,
    PublishingYear INT NOT NULL,
    Description NVARCHAR(1000),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);
CREATE TABLE Person(
    PersonID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50),
    Gender NVARCHAR(6),
    DateOfBirth DATE,
    StartDate DATE,
    Address NVARCHAR(200),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);
CREATE TABLE Borrow(
    BorrowID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    PersonID INT NOT NULL,
    BorrowDate DATE NOT NULL,
    Deadline DATE NOT NULL,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE BorrowDetails(
    BorrowID INT NOT NULL,
    BookID INT NOT NULL,
    Amount INT NOT NULL,
	Status NVARCHAR(20),
	ReturnDate DATE,
    FOREIGN KEY (BorrowID) REFERENCES Borrow(BorrowID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    PRIMARY KEY (BorrowID, BookID)
);


CREATE TABLE Role(
    RoleID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(50) NOT NULL
);
CREATE TABLE Users(
    Username VARCHAR(50) NOT NULL PRIMARY KEY,
    Password VARCHAR(50) NOT NULL,
    PersonID INT NOT NULL,
    RoleID INT NOT NULL,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);
CREATE TABLE Card(
    CardID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    PersonID INT NOT NULL,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
    ValidFrom DATE NOT NULL,
    ValidThru DATE NOT NULL
);
-- Insert data into Category table
INSERT INTO Category ( CategoryName) 
VALUES 
(N'Sách Khoa Học'),
(N'Sách Văn Học'),
(N'Tiểu Thuyết'),
(N'Kinh Tế'),
(N'Tâm Lý - Tâm Linh'),
(N'Kỹ Năng Sống'),
(N'Truyện Tranh'),
(N'Sách Thiếu Nhi'),
(N'Trinh Thám'),
(N'Sách Tôn Giáo');

-- Insert data into Publisher table
INSERT INTO Publisher (PublisherName, Address, Website, Email, Phone) 
VALUES 
(N'Nhà Xuất Bản Trẻ', N'Hà Nội', 'www.nxbtre.com.vn', 'info@nxbtre.com.vn', '0241234567'),
(N'Nhà Xuất Bản Kim Đồng', N'Hồ Chí Minh', 'www.nxbkimdong.com.vn', 'info@nxbkimdong.com.vn', '0287654321'),
(N'Nhà Xuất Bản Văn Hóa - Sài Gòn', N'Hồ Chí Minh', 'www.nxbvanhoa-sg.com.vn', 'info@nxbvanhoa-sg.com.vn', '0289876543'),
(N'Nhà Xuất Bản Lao Động Xã Hội', N'Hà Nội', 'www.nxlđxh.com.vn', 'info@nxldxh.com.vn', '0243333333'),
(N'Nhà Xuất Bản Thanh Niên', N'Hà Nội', 'www.nxbthanhnien.com.vn', 'info@nxbthanhnien.com.vn', '0242222222'),
(N'Nhà Xuất Bản Đại Học Quốc Gia Hà Nội', N'Hà Nội', 'www.nxb.dhqghn.edu.vn', 'info@nxb.dhqghn.edu.vn', '0245555555'),
(N'Nhà Xuất Bản Tổng Hợp Thành Phố Hồ Chí Minh', N'Hồ Chí Minh', 'www.nxbth.edu.vn', 'info@nxbth.edu.vn', '0284444444'),
(N'Nhà Xuất Bản Phụ Nữ', N'Hà Nội', 'www.nxbphunu.com.vn', 'info@nxbphunu.com.vn', '0247777777'),
(N'Nhà Xuất Bản Đại Học Quốc Gia TP.HCM', N'Hồ Chí Minh', 'www.nxbdhqgtp.hcm.edu.vn', 'info@nxbdhqgtp.hcm.edu.vn', '0288888888'),
(N'Nhà Xuất Bản Văn Nghệ', N'Hà Nội', 'www.nxbvannghe.com.vn', 'info@nxbvannghe.com.vn', '0249999999');

-- Insert data into Book table
INSERT INTO Book (BookName, Images, Author, PublisherID, CategoryID, PublishingYear, Description) 
VALUES 
(N'Dế Mèn Phiêu Lưu Ký', 'https://c1nghiadung.badinh.edu.vn/UploadFinder/images/2024/2/21/21022024111121_1.png', N'Tô Hoài', 1, 8, 2015, N'"Dế Mèn Phiêu Lưu Ký" là một tác phẩm văn học nổi tiếng của nhà văn Tô Hoài, xuất bản lần đầu vào năm 1941. Cuốn sách kể về hành trình phiêu lưu của nhân vật chính, Dế Mèn, một chú dế thông minh, dũng cảm và ham học hỏi. Trên đường phiêu lưu, Dế Mèn gặp gỡ nhiều nhân vật khác nhau và trải qua nhiều thử thách, từ đó học được những bài học quý báu về cuộc sống, tình bạn, và lòng dũng cảm. Tác phẩm được yêu thích bởi lối kể chuyện sinh động, hình ảnh nhân vật phong phú và mang đậm giá trị giáo dục.'),
(N'Harry Potter và Hòn Đá Phù Thủy', 'https://www.nxbtre.com.vn/Images/Book/nxbtre_full_21042022_030444.jpg', N'J.K. Rowling', 2,9, 2005, N'"Harry Potter và Hòn Đá Phù Thủy" là cuốn sách đầu tiên trong loạt truyện Harry Potter của J.K. Rowling. Tác phẩm xoay quanh cậu bé Harry Potter, một trẻ mồ côi sống với gia đình Dursley khắc nghiệt. Vào sinh nhật thứ 11, Harry phát hiện mình là phù thủy và được mời học tại Trường Phù thủy và Pháp sư Hogwarts. Tại đây, Harry kết bạn với Ron Weasley và Hermione Granger, đồng thời khám phá ra quá khứ của mình và sự tồn tại của Hòn Đá Phù Thủy, một vật thể quyền năng có thể mang lại sự bất tử. Câu chuyện kết hợp yếu tố kỳ ảo với tình bạn, lòng dũng cảm và cuộc chiến chống lại cái ác, cuốn hút độc giả ở mọi lứa tuổi.'),
(N'Tâm Lý Học Nhân Cách', 'https://nxbhcm.com.vn/Image/Biasach/image_244718_1_3674.jpg', N'Thomas Erikson', 3, 5, 2010, N'"Tâm Lý Học Nhân Cách" của Thomas Erikson, tựa gốc tiếng Anh là "Surrounded by Idiots," là một cuốn sách nghiên cứu về các loại tính cách con người dựa trên mô hình DISC. Trong sách, Erikson phân chia nhân cách thành bốn nhóm chính: Đỏ (Dominance - Thống trị), Vàng (Influence - Ảnh hưởng), Xanh lá cây (Steadiness - Kiên định) và Xanh dương (Conscientiousness - Tận tâm). Mỗi nhóm có những đặc điểm, hành vi, và cách tương tác xã hội riêng biệt. Cuốn sách giúp người đọc nhận diện và hiểu rõ hơn về bản thân cũng như những người xung quanh, từ đó cải thiện giao tiếp và xây dựng mối quan hệ tốt đẹp hơn trong cả cuộc sống cá nhân và công việc.'),
(N'Đắc Nhân Tâm', 'https://nxbhcm.com.vn/Image/Biasach/dacnhantam86.jpg', N'Dale Carnegie', 4,6, 2008, N'"Đắc Nhân Tâm" (How to Win Friends and Influence People) của Dale Carnegie là một trong những cuốn sách kinh điển về nghệ thuật giao tiếp và phát triển quan hệ cá nhân. Xuất bản lần đầu vào năm 1936, sách cung cấp những nguyên tắc và kỹ thuật giúp người đọc cải thiện kỹ năng giao tiếp, tạo thiện cảm, thuyết phục người khác, và xây dựng mối quan hệ tốt đẹp. Những bài học trong sách dựa trên các ví dụ thực tế và dễ áp dụng, giúp người đọc trở nên tự tin hơn, thành công hơn trong công việc và cuộc sống. Đây là một tài liệu hữu ích cho bất kỳ ai muốn phát triển kỹ năng giao tiếp và quản lý mối quan hệ.'),
(N'Dế Mèn Phiêu Lưu Ký 2', 'https://lh4.googleusercontent.com/proxy/EBAyH1uGo9-ZhCvcsFiKFa4AixalbCWbR39f4S2yR68MYzf16ZdapZAbcibeYnYrsLU7HTL-kTIOGFTexFw_u2Xmk3W7Iibz', N'Tô Hoài', 1,8, 2020, N'"Dế Mèn Phiêu Lưu Ký 2" của Tô Hoài tiếp tục kể về cuộc hành trình của nhân vật chính, Dế Mèn, sau những sự kiện của phần đầu tiên. Trong phần này, Dế Mèn tiếp tục khám phá thế giới xung quanh, gặp gỡ nhiều nhân vật mới và trải qua những cuộc phiêu lưu đầy thách thức. Qua mỗi cuộc gặp gỡ và thử thách, Dế Mèn học hỏi thêm về sự đa dạng của cuộc sống, tình bạn và lòng dũng cảm. Tác phẩm giữ vững lối kể chuyện sinh động, hấp dẫn và giàu tính giáo dục, đem lại những bài học sâu sắc về nhân sinh cho người đọc.'),
(N'Người Mẹ Tốt Hơn Là Người Thầy Tốt', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1494838322i/35138603.jpg', N'Ken Blanchard', 5,6, 2019, N'
"Sách Người Mẹ Tốt Hơn Là Người Thầy Tốt của Ken Blanchard là một tác phẩm mang tính cách mạng trong lĩnh vực giáo dục và nuôi dưỡng tinh thần. Tác giả tập trung vào vai trò của người cha mẹ trong việc hỗ trợ con cái phát triển và thành công hơn là việc chỉ đạo và dạy bảo. Blanchard khuyến khích phụ huynh hướng dẫn bằng ví dụ và tình yêu thương, giúp trẻ tự tin đối mặt với thử thách và phát triển bản thân."'),
(N'Anna Karenina', 'https://m.media-amazon.com/images/M/MV5BMTU0NDgxNDg0NV5BMl5BanBnXkFtZTcwMjE4MzkwOA@@._V1_.jpg', N'Lew Tolstoj', 6,3, 2012,N'"Anna Karenina" của Lew Tolstoj là một tác phẩm vĩ đại trong văn học thế giới, nói về cuộc sống và tình yêu trong xã hội Nga thế kỷ 19. Câu chuyện xoay quanh cuộc đời của nhân vật chính là Anna Karenina, một phụ nữ có vẻ ngoài hoàn hảo nhưng bị cuốn vào một tình yêu cấm kỵ, và cách cuộc tình này ảnh hưởng đến cuộc sống của cô và những người xung quanh. Tác phẩm khám phá sâu sắc về tình yêu, tội lỗi, và xã hội, mang lại cho độc giả những bài học về sự phức tạp của con người.'),
(N'Doraemon: Nobita và bản giao hưởng Địa Cầu', 'https://upload.wikimedia.org/wikipedia/en/thumb/5/5e/Doraemon-Nobita%27s_Earth_Symphony.jpg/220px-Doraemon-Nobita%27s_Earth_Symphony.jpg', N'Fujiko F Fujio', 7,8, 2018, N'"Doraemon: Nobita và bản giao hưởng Địa Cầu" là một câu chuyện phiêu lưu kỳ thú với sự tham gia của các nhân vật quen thuộc trong series Doraemon. Trong cuốn sách này, Nobita và các bạn của mình tham gia vào một cuộc phiêu lưu để bảo vệ Trái Đất khỏi mối đe dọa từ người ngoài hành tinh. Cuốn sách kể về hành trình của họ để giải cứu trái đất và khám phá sức mạnh của tình bạn và lòng dũng cảm.'),
(N'Nghệ Thuật Bán Hàng Của Do Thái', 'https://firstnews.com.vn/public/uploads/products/nghethuatbanhangnguoidothai-88k-01-bia-1.jpg', N'Zig Ziglar', 8,4, 2017, N'
"Nghệ Thuật Bán Hàng Của Do Thái" của Zig Ziglar là một cuốn sách kinh doanh kinh điển, nơi tác giả tập trung vào nguyên tắc bán hàng cơ bản và kỹ năng giao tiếp hiệu quả. Ziglar giới thiệu các nguyên lý bán hàng dựa trên triết lý và kinh nghiệm thực tế của người Do Thái, từ cách xây dựng mối quan hệ đến cách thúc đẩy sản phẩm và dịch vụ. Cuốn sách này mang lại những chiến lược cụ thể và sâu sắc để thành công trong lĩnh vực bán hàng.'),
(N'Thương Mại Điện Tử', 'https://hcct.edu.vn/wp-content/uploads/2023/02/2.24.1.jpg', N'Ao Thu Hoài', 9,4, 2016, N'Sách kinh tế học'),
(N'Thám tử lừng danh Conan: Quả bom chọc trời', 'https://upload.wikimedia.org/wikipedia/vi/3/39/Caseclosed_the_time_bombed_%28movie_1%29.jpg', N'Aoyama Gosho', 2,9, 2010, N'"Thám tử lừng danh Conan: Quả bom chọc trời" là một câu chuyện hồi hộp và kịch tính trong loạt truyện tranh nổi tiếng của Aoyama Gosho. Trong câu chuyện này, Conan Edogawa, cùng với các nhân vật khác, phải đối mặt với một tình huống nguy hiểm khi họ phải ngăn chặn một loạt các vụ đánh bom được thực hiện bởi một kẻ tâm thần đang muốn gây ra hỗn loạn. Cuốn sách này mang lại những bí ẩn ly kỳ và giải đố mà Conan cùng đội ngũ phải giải quyết, hứa hẹn mang lại cho độc giả những giây phút giải trí và căng thẳng.'),
(N'Thần Đồng Đất Việt', 'https://upload.wikimedia.org/wikipedia/vi/2/23/Than_dong_dat_viet.jpg', N'Lê Linh', 3,7, 2011, N'"Thần Đồng Đất Việt" là một cuốn sách viết về câu chuyện của cậu bé Phan Châu Trinh, một thiên tài trong lịch sử Việt Nam. Cuốn sách này tái hiện cuộc đời, sự nghiệp và tinh thần đấu tranh của Phan Châu Trinh trong việc vận động dân chủ và hiện đại hóa đất nước vào cuối thế kỷ 19 và đầu thế kỷ 20. Tác phẩm không chỉ là một câu chuyện về cuộc đời của một nhà cách mạng lớn của dân tộc, mà còn là một lời nhắc nhở về tinh thần không ngừng nỗ lực và hy sinh cho sự tiến bộ của quốc gia.'),
(N'Truyện Cổ Tích Việt Nam', 'https://www.nxbtre.com.vn/Images/Book/NXBTreStoryFull_19242015_102435.jpg', N'Nguyễn Đổng Chi', 1,8, 2018, N'"Truyện Cổ Tích Việt Nam" của Nguyễn Đổng Chi là một tập hợp các câu chuyện dân gian truyền miệng của Việt Nam, được chuyển thể thành sách với ngôn ngữ sinh động và hình ảnh sống động. Cuốn sách này giới thiệu cho độc giả về văn hóa và truyền thống dân tộc Việt, từ những câu chuyện về công chúa, hoàng tử, đến những câu chuyện về rồng, sư tử và các loài thú rừng. Điều đặc biệt của cuốn sách là cách tác giả kể lại những câu chuyện này với sự tình cảm và sức sống đầy màu sắc, thu hút người đọc mọi lứa tuổi.'),
(N'Cách Mạng Công Nghiệp 4.0', 'https://www.nxbctqg.org.vn/img_data/images/697959110613_cn.jpg', N'Klaus Schwab', 9,4, 2019, N'"Cách Mạng Công Nghiệp 4.0" của Klaus Schwab là một tác phẩm quan trọng giải thích về sự ảnh hưởng của Cách mạng Công nghiệp 4.0 đối với thế giới hiện đại. Schwab khám phá sự kết hợp giữa công nghệ số, tự động hóa, trí tuệ nhân tạo và dữ liệu trong môi trường kinh doanh và xã hội. Cuốn sách này phân tích những thách thức và cơ hội của thế giới mới này, đồng thời đề xuất các chiến lược để tận dụng sức mạnh của Cách mạng Công nghiệp 4.0 để xây dựng một tương lai bền vững và phồn thịnh.'),
(N'Tôi Tài Giỏi Bạn Cũng Thế', 'https://lh4.googleusercontent.com/proxy/92QuMwJnEjAGTfNMAB9joNXoouO9NuduIgBPaKtL0h0UPvaeTFj3Xef967P3mbrE7F1J5cfnvn2PKw8cwIINHMhxf9L2C3bPRQ2Ef14EVeZAIb_rdt3WzLOb98FXMVhAs2lNuT9ABlcODTeUqt5z27FQ8fQE4ZtQEw', N'Adam Khoo', 4,6, 2020, N'
"Tôi Tài Giỏi, Bạn Cũng Thế" của Adam Khoo là một cuốn sách tự luyện và phát triển bản thân, nhằm truyền cảm hứng và kỹ năng cho độc giả. Khoo chia sẻ về những bí quyết và phương pháp mà anh đã áp dụng để đạt được thành công trong cuộc sống và sự nghiệp của mình. Từ việc đặt mục tiêu, quản lý thời gian đến kỹ năng giao tiếp và tư duy tích cực, cuốn sách này cung cấp cho độc giả những công cụ cần thiết để phát triển bản thân và đạt được mục tiêu trong cuộc sống.'),
(N'Suy Nghĩ Và Làm Giàu', 'https://cdn0.fahasa.com/media/catalog/product/n/g/nghigiaulamgiau_110k-01_bia-1.jpg', N'Napoleon Hill', 8,4, 2016, N'"Suy Nghĩ Và Làm Giàu" của Napoleon Hill là một trong những cuốn sách kinh điển về phát triển bản thân và thành công trong kinh doanh. Hill tập trung vào quan điểm tích cực và tác động của suy nghĩ lên thành công cá nhân. Ông chia sẻ những nguyên tắc và chiến lược đã giúp nhiều người đạt được thành công vượt bậc trong cuộc sống và sự nghiệp của họ. Cuốn sách này không chỉ là một nguồn cảm hứng mà còn là một hướng dẫn thực hành để áp dụng triết lý suy nghĩ tích cực vào cuộc sống hàng ngày và đạt được mục tiêu lớn.'),
(N'7 Thói Quen Của Bạn Trẻ Thành Đạt', 'https://salt.tikicdn.com/ts/product/b6/c6/97/650d0d5e44f107f6049af37d74770351.png', N'Stephen Covey', 5,6, 2015, N'"7 Thói Quen Của Bạn Trẻ Thành Đạt" của Stephen Covey là một cuốn sách tự luyện và phát triển bản thân dành cho độc giả trẻ tuổi. Covey giới thiệu một khuôn mẫu cho sự thành công cá nhân dựa trên 7 thói quen cơ bản. Từ việc đặt mục tiêu rõ ràng, ưu tiên công việc quan trọng, cho đến việc hiểu và tôn trọng người khác, cuốn sách này cung cấp cho độc giả những nguyên tắc và chiến lược để phát triển bản thân và đạt được mục tiêu trong cuộc sống và sự nghiệp.'),
(N'Nhà Giả Kim', 'https://upload.wikimedia.org/wikipedia/vi/9/9c/Nh%C3%A0_gi%E1%BA%A3_kim_%28s%C3%A1ch%29.jpg', N'Paulo Coelho', 7,3, 2012, N'"Nhà Giả Kim" của Paulo Coelho là một cuốn tiểu thuyết tâm linh và phiêu lưu nổi tiếng trên toàn thế giới. Câu chuyện xoay quanh Santiago, một người chăn cừu trẻ tuổi từ Andalusia, Tây Ban Nha, đi tìm kiếm giấc mơ của mình về một kho báu kỳ diệu ở Ai Cập. Trong hành trình tìm kiếm, Santiago trải qua những trải nghiệm đầy học hỏi và phát triển bản thân, khám phá ra ý nghĩa sâu sắc về cuộc sống, tình yêu và ý nghĩa của việc theo đuổi giấc mơ của mình. Cuốn sách này truyền cảm hứng và ý nghĩa về sự kiên trì, sức mạnh của ước mơ và khả năng biến mọi điều trở thành hiện thực.'),
(N'Người Nam Châm', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWyPfTtzJnUzjFO4x1No8rlfZnIk_xdnBNaQ&s', N'Jack Canfield', 6,6, 2013, N'"Người Nam Châm" của Jack Canfield là một cuốn sách tự luyện và phát triển bản thân, tập trung vào quy tắc "Luật Hấp Dẫn" trong cuộc sống và sự nghiệp. Canfield giới thiệu các nguyên tắc và kỹ thuật để thu hút những điều tích cực và thành công vào cuộc sống của bạn thông qua việc tạo ra một tư duy tích cực và hành động nhằm đạt được mục tiêu cá nhân và nghề nghiệp. Cuốn sách này cung cấp cho độc giả những chiến lược cụ thể và kinh nghiệm thực tiễn để tăng cường sức mạnh của họ và thu hút thành công vào cuộc sống.'),
(N'Lập Trình Python', 'https://down-vn.img.susercontent.com/file/99c903162c105742b28d30c3f7dbe5c8', N'Đoàn Minh Phụng', 9,4, 2021,N'"Lập Trình Python" của Đoàn Minh Phụng là một cuốn sách hướng dẫn chi tiết về ngôn ngữ lập trình Python, từ cơ bản đến nâng cao. Tác giả cung cấp kiến thức vững chắc về cú pháp, cách sử dụng các thư viện và công cụ phổ biến trong Python. Cuốn sách này không chỉ dành cho người mới bắt đầu mà còn phù hợp cho những lập trình viên có kinh nghiệm muốn nâng cao kiến thức về Python. Đồng thời, nó cũng cung cấp các ví dụ và bài tập thực hành giúp độc giả hiểu rõ hơn và áp dụng linh hoạt trong công việc lập trình hàng ngày.'),
(N'Tiếng Gọi Nơi Hoang Dã', 'https://thptluongngocquyen.thainguyen.edu.vn/upload/s/20171226/12b676d468fcf6423474524369bb7ed2tgnhd1701.jpg', N'Jack London', 2,3, 2010, N'"Tiếng Gọi Nơi Hoang Dã" của Jack London là một câu chuyện kinh điển về cuộc sống và cuộc phiêu lưu của một con chó sói tên là Buck. Buck trải qua nhiều biến cố, từ cuộc sống xa xôi ở miền Nam California cho đến vùng Alaska hoang dã, nơi mà cơ duyên đã đưa anh trở thành lính thú cho một đội xe kéo tuyết. Cuốn sách này tập trung vào sự phát triển và tinh thần đấu tranh của Buck trong môi trường khắc nghiệt của hoang dã, đồng thời khám phá về tình bạn, lòng trung thành và ý chí sống sót.'),
(N'Thế Giới Phẳng', 'https://cdn0.fahasa.com/media/catalog/product/t/h/the-gioi-phang.jpg', N'Thomas L. Friedman', 1,4, 2017, N'
"Thế Giới Phẳng" của Thomas L. Friedman là một cuốn sách kinh điển nói về sự biến đổi toàn cầu do sự phát triển của công nghệ thông tin và viễn thông. Friedman mô tả cách mà sự kết nối toàn cầu thông qua internet và các công nghệ mới đã làm phẳng thế giới, tạo ra cơ hội mới cho mọi người và mọi tổ chức. Cuốn sách này khám phá về tác động của sự phẳng hóa thế giới lên kinh tế, văn hóa và xã hội, đồng thời đề xuất các chiến lược và triết lý để tận dụng cơ hội và đối phó với thách thức trong thế giới phẳng này.'),
(N'Làm Chủ Tư Duy Thay Đổi Vận Mệnh', 'https://cdn0.fahasa.com/media/catalog/product/l/a/lam-chu-tu-duy.jpg', N'Adam Khoo', 5,6, 2019, N'
"Làm Chủ Tư Duy Thay Đổi Vận Mệnh" của Adam Khoo là một cuốn sách tự luyện và phát triển bản thân, tập trung vào việc nắm bắt và kiểm soát tư duy để thay đổi cuộc sống và vận mệnh cá nhân. Khoo chia sẻ về quy trình tự phát triển bản thân, từ việc đặt mục tiêu, tư duy tích cực, đến kỹ năng quản lý thời gian và tăng cường lòng tự tin. Cuốn sách này cung cấp cho độc giả những chiến lược cụ thể và kỹ thuật để thúc đẩy sự phát triển cá nhân và đạt được thành công trong cuộc sống.'),
(N'Trí Tuệ Do Thái', 'https://bizweb.dktcdn.net/100/197/269/products/tri-tue-do-thai.jpg?v=1510634413673', N'Yehuda Berg', 4,5, 2014, N'
"Trí Tuệ Do Thái" của Yehuda Berg là một cuốn sách tập trung vào việc khám phá và áp dụng triết lý và truyền thống của người Do Thái vào cuộc sống hàng ngày. Berg giới thiệu về khái niệm "Trí Tuệ Do Thái" - một cách tiếp cận đầy tinh thần và sáng tạo đối với cuộc sống, hạnh phúc và thành công. Cuốn sách này khám phá về triết lý sống, tình yêu và sự hiểu biết, mang lại những lời khuyên thực tế và sâu sắc để tạo ra một cuộc sống ý nghĩa và giàu có ý nghĩa hơn.'),
(N'Học Khôn Từ Thất Bại', 'https://www.khaitam.com/Data/Sites/1/Product/4091/hoc-tu-that-bai.jpg', N'John C. Maxwell', 6,6, 2018,N'
"Học Khôn Từ Thất Bại" của John C. Maxwell là một cuốn sách tôn vinh sự quý giá của những trải nghiệm thất bại trong cuộc sống. Maxwell khuyến khích độc giả nhìn nhận thất bại như một cơ hội học hỏi và phát triển bản thân. Thông qua việc chia sẻ những câu chuyện và bài học từ những người thành công, cuốn sách này truyền cảm hứng và khích lệ độc giả vượt qua nỗi sợ hãi và tiếp tục nỗ lực trên con đường đến thành công.');

-- Insert data into Person table (Readers and Employees)
INSERT INTO Person (Name, Gender, DateOfBirth, StartDate, Address, Email, Phone) 
VALUES 
(N'Nguyễn Văn Nam', N'Nam', '1980-01-01', NULL, N'123 Đường A, Hà Nội', 'vana@gmail.com', '0901000001'),
(N'Nguyễn Thị Bích', N'Nữ', '1990-02-02', NULL, N'456 Đường B, Hồ Chí Minh', 'thib@gmail.com', '0902000002'),
( N'Trần Văn Lượng', N'Nam', '1985-03-03', NULL, N'789 Đường C, Đà Nẵng', 'vanc@gmail.com', '0903000003'),
( N'Phạm Quang Vũ', N'Nam', '1975-04-04', '2010-01-01', N'321 Đường D, Hà Nội', 'vand@gmail.com', '0904000004'),
( N'Lê Thị Thúy', N'Nữ', '1988-05-05', '2012-02-02', N'654 Đường E, Hồ Chí Minh', 'thie@gmail.com', '0905000005'),
(N'Phạm Văn Tiến', N'Nam', '1992-06-06', '2015-03-03', N'987 Đường F, Đà Nẵng', 'vanf@gmail.com', '0906000006'),
(N'Phạm Đức Long', N'Nam', '2004-09-27', NULL, N'123 Đường G, Hà Nội', 'longpd@gmail.com', '0907000007'),
(N'Trần Thị Linh', N'Nữ', '1995-08-08', NULL, N'456 Đường H, Hồ Chí Minh', 'thih@gmail.com', '0908000008'),
(N'Phạm Phúc Lân', N'Nam', '1998-09-09', NULL, N'789 Đường I, Đà Nẵng', 'vani@gmail.com', '0909000009'),
(N'Lê Thị Hà', N'Nữ', '1987-10-10', NULL, N'321 Đường J, Hà Nội', 'thij@gmail.com', '0910000010');

-- Insert data into Borrow table
INSERT INTO Borrow (PersonID, BorrowDate, Deadline) 
VALUES 
(1, '2023-01-01', '2023-01-15'),
(2, '2023-02-01', '2023-02-15'),
(3, '2023-03-01', '2023-03-15'),
(4, '2023-04-01', '2023-04-15'),
(5, '2023-05-01', '2023-05-15'),
(6, '2023-06-01', '2023-06-15'),
(7, '2023-07-01', '2023-07-15');

INSERT INTO BorrowDetails (BorrowID, BookID, Amount, Status, ReturnDate) 
VALUES 
(1, 1, 1, N'Đã trả', '2023-01-10'),
(2, 2, 3, N'Đã trả', '2023-02-14'),
(3, 3, 4, N'Đã trả', '2023-03-20'),
(4, 4, 2, N'Đã trả', '2023-04-12'),
(5, 5, 3, N'Đã trả', '2023-05-14'),
(6, 6, 2, N'Đã trả', '2023-06-22'),
(7, 7, 4, N'Đã trả', '2023-07-14');

-- Insert data into Role table
INSERT INTO Role (RoleName) 
VALUES 
(N'User'),
(N'Employee'),
(N'Admin');

-- Insert data into Users table
INSERT INTO Users (Username, Password, PersonID, RoleID) 
VALUES 
('admin', '123', 10, 3),
('user1', '123', 1, 1),
('user2', '123', 2, 1),
('user3', '123', 3, 1),
('user4', '123', 4, 1),
('user5', '123', 5, 1),
('user6', '123', 6, 1),
('user7', '123', 7, 1),
('employee1','123', 8, 2),
('employee2','123', 9, 2);

INSERT INTO Card(PersonID, ValidFrom, ValidThru)
VALUES
(1, '2021-01-01', '2028-01-01'),
(2, '2021-09-09', '2028-09-09'),
(3, '2021-09-15', '2028-09-15'),
(4, '2021-09-27', '2028-09-27'), 
(5, '2021-10-10', '2028-10-10'),
(6, '2021-08-06', '2028-08-06'),
(7, '2021-09-10', '2028-09-10');
