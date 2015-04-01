SimpleSchema.messages
  required: "[label] это обязательное поле"
  minString: "Длинна поля [label] должна быть больше [min] символов"
  maxString: "Длинна поля [label] должна быть меньше [max] символов"
  minNumber: "Значение поля [label] должно быть больше [min]"
  maxNumber: "Значение поля [label] должно быть меньше [max]"
  minDate: "[label] после [min]"
  maxDate: "[label] после [max]"
  badDate: "[label] не правильная дата"
  minCount: "You must specify at least [minCount] values"
  maxCount: "You cannot specify more than [maxCount] values"
  noDecimal: "[label] должно быть целочисленным"
  notAllowed: "[value] не допустимое значение"
  expectedString: "[label] должно быть строкой"
  expectedNumber: "[label] должно быть числом"
  expectedBoolean: "[label] должно быть булевым числом"
  expectedArray: "[label] должно быть массивом"
  expectedObject: "[label] должно быть объектом"
  expectedConstructor: "[label] должно быть типом [type]"
  regEx: [
    {msg: "[label] failed regular expression validation"}
    {exp: SimpleSchema.RegEx.Email, msg: "[label] must be a valid e-mail address"}
    {exp: SimpleSchema.RegEx.WeakEmail, msg: "[label] must be a valid e-mail address"}
    {exp: SimpleSchema.RegEx.Domain, msg: "[label] must be a valid domain"}
    {exp: SimpleSchema.RegEx.WeakDomain, msg: "[label] must be a valid domain"}
    {exp: SimpleSchema.RegEx.IP, msg: "[label] must be a valid IPv4 or IPv6 address"}
    {exp: SimpleSchema.RegEx.IPv4, msg: "[label] must be a valid IPv4 address"}
    {exp: SimpleSchema.RegEx.IPv6, msg: "[label] must be a valid IPv6 address"}
    {exp: SimpleSchema.RegEx.Url, msg: "[label] must be a valid URL"}
    {exp: SimpleSchema.RegEx.Id, msg: "[label] must be a valid alphanumeric ID"}
  ]
  keyNotInSchema: "Поля [key] нет в схеме данных"
