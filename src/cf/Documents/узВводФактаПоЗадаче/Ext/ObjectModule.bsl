﻿
Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	
	НаборЗаписей = Движения.узФактПоЗадачам;
	НаборЗаписей.Записывать = Истина;
		
	Для каждого СтрокаДанные из Данные цикл
		
		Запись = НаборЗаписей.Добавить();		
		Запись.Период = Дата;
		Запись.Задача = Задача;
		Запись.Исполнитель = Исполнитель;
		Запись.Спринт = СтрокаДанные.Спринт;		
		Запись.ДатаНачала = СтрокаДанные.ДатаНачала;
		Запись.ДатаОкончания = СтрокаДанные.ДатаОкончания;
		
		Запись.Факт = СтрокаДанные.Факт;
	Конеццикла;
	
КонецПроцедуры

Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	
	Если ПараметрыСеанса.узЗапретитьВводФактаДляОсновныхЗадач Тогда
		ЭтоЗадачаПроекта = ЗначениеЗаполнено(Задача.ОсновнаяЗадача);
		
		Если ЭтоЗадачаПроекта = Ложь Тогда
			
			Отказ = Истина;
			СообщениеОшибки = Новый СообщениеПользователю();
			СообщениеОшибки.Текст = "Для задачи - проекта нет озможности ввода данных о факте работ!";
			СообщениеОшибки.Поле = Ссылка;
			СообщениеОшибки.ПутьКДанным = "Объект.Задача";
			СообщениеОшибки.Сообщить();
			
		КонецЕсли;
		
		Если Справочники.узЗадачи.ЗадачаБезПодчененнойИерархии(Задача) Тогда 
			Отказ = Истина;
			СообщениеОшибки = Новый СообщениеПользователю();
			СообщениеОшибки.Текст = "Для задачи, которая имеет подчененные задачи,  нет озможности ввода данных о факте работ!";
			СообщениеОшибки.Поле = Ссылка;
			СообщениеОшибки.ПутьКДанным = "Объект.Задача";
			СообщениеОшибки.Сообщить();
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

