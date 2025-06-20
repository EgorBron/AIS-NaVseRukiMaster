Процедура ОбработкаПроведения(Отказ,Режим)
	Движения.Начисления.Записывать = Истина;
	Для Каждого ТекСтрокаНачисления из Начисления Цикл
		Движение = Движения.Начисления.Добавить();
		Движение.Сторно = Ложь;
		Движение.ВидРасчета = ТекСтрокаНачисления.ВидРасчета;
		Движение.ПериодРегистрации = Дата;
		Движение.ПериодДействияНачало = ТекСтрокаНачисления.ДатаНачала;
		Движение.ПериодДействияКонец = КонецДня(ТекСтрокаНачисления.ДатаОкончания);
		Движение.БазовыйПериодНачало = ТекСтрокаНачисления.ДатаНачала;
		Движение.БазовыйПериодКонец = КонецДня(ТекСтрокаНачисления.ДатаОкончания);
		Движение.Сотрудник = ТекСтрокаНачисления.Сотрудник;
		Движение.ГрафикРаботы = ТекСтрокаНачисления.ГрафикРаботы;
		Движение.ИсходныеДанные = ТекСтрокаНачисления.Начислено;
	КонецЦикла;
	
	Движения.Начисления.Записать();
	
	Запрос = Новый Запрос( // select distinct так-то!
		"выбрать различные НачислСотр.Сотрудник
		|из Документ.НачисленияСотрудникам.Начисления как НачислСотр
		|где НачислСотр.Ссылка = &ТекущийДокумент");
		
	Запрос.УстановитьПараметр("ТекущийДокумент", Ссылка);
	ТбЗнач = Запрос.Выполнить().Выгрузить();
	Сотрудники = ТбЗнач.ВыгрузитьКолонку("Сотрудник");
	
	ПроведениеРасчетов.РассчитатьНачисления(Движения.Начисления,
		ПланыВидовРасчета.ОсновныеНачисления.Оклад, Сотрудники);
	Движения.Начисления.Записать(, Истина);
	
	ПроведениеРасчетов.РассчитатьНачисления(Движения.Начисления,
		ПланыВидовРасчета.ОсновныеНачисления.Премия, Сотрудники);
	Движения.Начисления.Записать(, Истина);
//	ПроведениеРассчетов.РассчитатьНачисления(Движения.Начисления,
//		ПланыВидовРасчета.ОсновныеНачисления.Оклад, Сотрудники);
КонецПроцедуры