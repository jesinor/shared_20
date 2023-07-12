object FDataModulo: TFDataModulo
  OldCreateOrder = False
  Height = 419
  Width = 466
  object spMaesbas: TADOCommand
    CommandText = 
      'INSERT INTO CO_MAESBAS'#13#10'( ASIENTO, CODIGO, COEFICIENTE, DETALLE,' +
      ' FECHA, FECHAOP, NUMERO, OPERADOR )'#13#10'VALUES'#13#10'( :ASIENTO, :CODIGO' +
      ', :COEFICIENTE, :DETALLE, :FECHA, :FECHAOP, :NUMERO, :OPERADOR )' +
      #13#10
    Parameters = <
      item
        Name = 'ASIENTO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CODIGO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 4
        Value = Null
      end
      item
        Name = 'COEFICIENTE'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'DETALLE'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 80
        Value = Null
      end
      item
        Name = 'FECHA'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'FECHAOP'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'NUMERO'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'OPERADOR'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 4
        Value = Null
      end>
    Left = 54
    Top = 6
  end
  object spMaestro: TADOCommand
    CommandText = 
      'INSERT INTO CO_MAESTRO'#13#10'( ASIENTO, CUENTA, FECHA, IMPORTE, LEYEN' +
      'DA, SALDO, SUBCOD )'#13#10'VALUES'#13#10'( :ASIENTO, :CUENTA, :FECHA, :IMPOR' +
      'TE, :LEYENDA, :SALDO, :SUBCOD )'#13#10
    Parameters = <
      item
        Name = 'ASIENTO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CUENTA'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 4
        Value = Null
      end
      item
        Name = 'FECHA'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'IMPORTE'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'LEYENDA'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'SALDO'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'SUBCOD'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 3
        Value = Null
      end>
    Left = 54
    Top = 56
  end
  object QElimMaesbas: TADOCommand
    CommandText = 'DELETE FROM CO_MAESBAS'#13#10'WHERE ASIENTO = :ASIENTO'#13#10
    Parameters = <
      item
        Name = 'ASIENTO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 132
    Top = 36
  end
  object QElimMaestro: TADOCommand
    CommandText = 'DELETE FROM CO_MAESTRO'#13#10'WHERE ASIENTO = :ASIENTO'#13#10
    Parameters = <
      item
        Name = 'ASIENTO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 132
    Top = 96
  end
  object QUpdSaldoCta: TADOCommand
    CommandText = 
      'UPDATE CO_CUENTAS'#13#10'SET SALDO = SALDO - :IMPORTE'#13#10'WHERE CUENTA = ' +
      ':CUENTA'#13#10
    Parameters = <
      item
        Name = 'IMPORTE'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'CUENTA'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 4
        Value = Null
      end>
    Left = 132
    Top = 156
  end
  object QSelCtas: TADODataSet
    CommandText = 
      'SELECT CUENTA, IMPORTE FROM CO_MAESTRO'#13#10'WHERE ASIENTO = :ASIENTO' +
      #13#10
    Parameters = <
      item
        Name = 'ASIENTO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 116
    Top = 240
    object QSelCtasCUENTA: TStringField
      FieldName = 'CUENTA'
      Size = 4
    end
    object QSelCtasIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
  end
  object updUltinum: TADOCommand
    CommandText = 
      'UPDATE CO_ULTINUM'#13#10'SET NUMERO = NUMERO + 1'#13#10'WHERE CODIGO = '#39'MAES' +
      'BAS'#39
    Parameters = <>
    Left = 40
    Top = 248
  end
  object getUltiNum: TADODataSet
    CursorType = ctStatic
    CommandText = 'SELECT NUMERO'#13#10'FROM CO_ULTINUM'#13#10'WHERE CODIGO = '#39'MAESBAS'#39
    Parameters = <>
    Left = 40
    Top = 312
    object getUltiNumNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
  end
  object updCuentas: TADOCommand
    CommandText = 
      'UPDATE CO_CUENTAS'#13#10'SET SALDO = SALDO + :IMPORTE'#13#10'WHERE CUENTA = ' +
      ':CUENTA'
    Parameters = <
      item
        Name = 'IMPORTE'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'CUENTA'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 4
        Value = Null
      end>
    Left = 112
    Top = 312
  end
end
