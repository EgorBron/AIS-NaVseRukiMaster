#Область ОбработчикиСобытийЭлементовТаблицыФормыПереченьНоменклатуры
&НаКлиенте
Процедура ПереченьНоменклатурыЦенаПриИзменении(Элемент)
	СтрТаблЧасти = Элементы.ПереченьНоменклатуры.ТекущиеДанные;
	РаботаСДокументами.РассчетСуммыСтроки(СтрТаблЧасти);
КонецПроцедуры

&НаКлиенте
Процедура ПереченьНоменклатурыКоличествоПриИзменении(Элемент)
	СтрТаблЧасти = Элементы.ПереченьНоменклатуры.ТекущиеДанные;
	РаботаСДокументами.РассчетСуммыСтроки(СтрТаблЧасти);
КонецПроцедуры

&НаКлиенте
Процедура ПереченьНоменклатурыНоменклатураПриИзменении(Элемент)
	СтрТаблЧасти = Элементы.ПереченьНоменклатуры.ТекущиеДанные;
	СтрТаблЧасти.Цена = РаботаСоСправочниками.РозничнаяЦена(Объект.Дата, СтрТаблЧасти.Номенклатура);
	РаботаСДокументами.РассчетСуммыСтроки(СтрТаблЧасти);
КонецПроцедуры
#КонецОбласти