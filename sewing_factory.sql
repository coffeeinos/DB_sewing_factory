-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 23 2020 г., 23:00
-- Версия сервера: 8.0.19
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sewing_factory`
--

-- --------------------------------------------------------

--
-- Структура таблицы `administrator`
--

CREATE TABLE `administrator` (
  `id` int NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `phone_number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `administrator`
--

INSERT INTO `administrator` (`id`, `full_name`, `phone_number`) VALUES
(1, 'Иван Иванов Иванов', 631234567),
(2, 'Иван Иванов Петров', 631234568),
(3, 'Иван Иванов сидоров', 631234569);

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE `customer` (
  `id` int NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `phone_number` int NOT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`id`, `full_name`, `phone_number`, `email`) VALUES
(1, 'Петор Петров Петрович', 631111111, 'test1@gmail.com'),
(2, 'Петор Петров Иванов', 631111112, 'test2@gmail.com'),
(3, 'Петор Петров Сидоров', 631111113, 'test3@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `master`
--

CREATE TABLE `master` (
  `id` int NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `timetable` datetime NOT NULL,
  `discharge` int NOT NULL
) ;

--
-- Дамп данных таблицы `master`
--

INSERT INTO `master` (`id`, `full_name`, `qualification`, `timetable`, `discharge`) VALUES
(1, 'Данилов Гаянэ Иосифович', 'швея', '2020-06-04 09:15:28', 3),
(2, 'Герасимов Адам Геннадиевич', 'швея', '2020-05-04 10:15:28', 4),
(3, 'Абрамов Кирилл Авксентьевич', 'швея', '2020-04-04 11:15:28', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `master_product`
--

CREATE TABLE `master_product` (
  `id_master` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int NOT NULL
) ;

--
-- Дамп данных таблицы `master_product`
--

INSERT INTO `master_product` (`id_master`, `id_product`, `quantity`) VALUES
(1, 1, 15),
(2, 2, 16),
(3, 3, 17);

-- --------------------------------------------------------

--
-- Структура таблицы `material`
--

CREATE TABLE `material` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `material`
--

INSERT INTO `material` (`id`, `name`) VALUES
(1, 'Шелк'),
(2, 'Хлопок'),
(3, 'Шерсть');

-- --------------------------------------------------------

--
-- Структура таблицы `material_product`
--

CREATE TABLE `material_product` (
  `id_material` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int NOT NULL
) ;

--
-- Дамп данных таблицы `material_product`
--

INSERT INTO `material_product` (`id_material`, `id_product`, `quantity`) VALUES
(1, 1, 15),
(2, 2, 16),
(3, 3, 17);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `product_type` varchar(100) NOT NULL,
  `quantity` int NOT NULL,
  `material` varchar(100) NOT NULL,
  `customer` varchar(50) NOT NULL,
  `price` int NOT NULL
) ;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `product_type`, `quantity`, `material`, `customer`, `price`) VALUES
(1, 'Шторы', 5, 'Хлопок', 'Кудряшов Альфред Ефимович', 269),
(2, 'Платье', 4, 'Шелк', 'Федосеев Марк Вениаминович', 1500),
(3, 'Рубашка', 25, 'Лен', 'Русаков Устин Юлианович', 2500);

-- --------------------------------------------------------

--
-- Структура таблицы `supplier`
--

CREATE TABLE `supplier` (
  `id` int NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `type_of_supply` text NOT NULL,
  `phone_number` int NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `supplier`
--

INSERT INTO `supplier` (`id`, `company_name`, `type_of_supply`, `phone_number`, `address`, `email`) VALUES
(1, 'Компания 1', 'Ткани', 632222222, 'г.Киев ул.Владимирская 25/4', 'test3@gmail.com'),
(2, 'Компания 2', 'Фурнитура', 632222223, 'г.Киев ул.Пушкинская 26/4', 'test4@gmail.com'),
(3, 'Компания 3', 'Смешенная', 632222224, 'г.Киев ул.Саксаганского 27/4', 'test5@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `supply`
--

CREATE TABLE `supply` (
  `id` int NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `batch_number` int NOT NULL,
  `date_of_delivery` date NOT NULL
) ;

--
-- Дамп данных таблицы `supply`
--

INSERT INTO `supply` (`id`, `supplier_id`, `batch_number`, `date_of_delivery`) VALUES
(1, 1, 1, '2020-04-05'),
(2, 2, 2, '2020-05-05'),
(3, 3, 3, '2020-06-05');

-- --------------------------------------------------------

--
-- Структура таблицы `supply_material`
--

CREATE TABLE `supply_material` (
  `id_supply` int NOT NULL,
  `id_material` int NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL
) ;

--
-- Дамп данных таблицы `supply_material`
--

INSERT INTO `supply_material` (`id_supply`, `id_material`, `quantity`, `price`) VALUES
(1, 1, 15, 256),
(2, 2, 16, 257),
(3, 3, 17, 258);

-- --------------------------------------------------------

--
-- Структура таблицы `the_order`
--

CREATE TABLE `the_order` (
  `id` int NOT NULL,
  `id_customer` int NOT NULL,
  `id_administrator` int NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `the_order`
--

INSERT INTO `the_order` (`id`, `id_customer`, `id_administrator`, `date`) VALUES
(1, 1, 1, '2020-04-05'),
(2, 2, 2, '2020-05-05'),
(3, 3, 3, '2020-06-05');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `master`
--
ALTER TABLE `master`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `master_product`
--
ALTER TABLE `master_product`
  ADD KEY `id_master` (`id_master`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `material_product`
--
ALTER TABLE `material_product`
  ADD KEY `id_material` (`id_material`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `supply`
--
ALTER TABLE `supply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Индексы таблицы `supply_material`
--
ALTER TABLE `supply_material`
  ADD KEY `id_supply` (`id_supply`),
  ADD KEY `id_material` (`id_material`);

--
-- Индексы таблицы `the_order`
--
ALTER TABLE `the_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_administrator` (`id_administrator`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `master`
--
ALTER TABLE `master`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `material`
--
ALTER TABLE `material`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `supply`
--
ALTER TABLE `supply`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `the_order`
--
ALTER TABLE `the_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `master_product`
--
ALTER TABLE `master_product`
  ADD CONSTRAINT `master_product_ibfk_1` FOREIGN KEY (`id_master`) REFERENCES `master` (`id`),
  ADD CONSTRAINT `master_product_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);

--
-- Ограничения внешнего ключа таблицы `material_product`
--
ALTER TABLE `material_product`
  ADD CONSTRAINT `material_product_ibfk_1` FOREIGN KEY (`id_material`) REFERENCES `material` (`id`),
  ADD CONSTRAINT `material_product_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);

--
-- Ограничения внешнего ключа таблицы `supply`
--
ALTER TABLE `supply`
  ADD CONSTRAINT `supply_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

--
-- Ограничения внешнего ключа таблицы `supply_material`
--
ALTER TABLE `supply_material`
  ADD CONSTRAINT `supply_material_ibfk_1` FOREIGN KEY (`id_supply`) REFERENCES `supply` (`id`),
  ADD CONSTRAINT `supply_material_ibfk_2` FOREIGN KEY (`id_material`) REFERENCES `material` (`id`);

--
-- Ограничения внешнего ключа таблицы `the_order`
--
ALTER TABLE `the_order`
  ADD CONSTRAINT `the_order_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `the_order_ibfk_2` FOREIGN KEY (`id_administrator`) REFERENCES `administrator` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
