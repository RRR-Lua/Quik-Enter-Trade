_QuikRM5 			= {};
_QuikRM5.name		= '����� ���������� � ���� (���-��)';
_QuikRM5.cell_name 	= '���-�� ��� >= ###1### (###2###)'; -- ��������
_QuikRM5.cell_help 	= '_QuikRM5:check()'; -- ������������
_QuikRM5.cell_eval	= '_QuikRM5:check()'; -- ����� �� ��������� ��� ������

-- ����������
function _QuikRM5:val()
	local var_1 = _QuikUtilityRMSetting("_QuikRM5",2);
	local var_2 = _QuikUtilityLogCounterGet("order-today."..os.date("%d-%m-%Y", os.time()));
	return {
		var_1,
		var_2,
	};
end;

-- ��������
function _QuikRM5:check()
	local vars = _QuikRM5:val();
	if vars[2] >= vars[1] then
		return 1;
	end;
	return 0;
end;