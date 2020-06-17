_QuikRM1 			= {};
_QuikRM1.name		= '����� ������ �������� �� 1 ���� � "%" �� ��������';
_QuikRM1.cell_name 	= '����� � ��: >= ###1###% (###2###%)'; -- ��������
_QuikRM1.cell_help 	= '_QuikRM1:check()'; -- ������������
_QuikRM1.cell_eval	= '_QuikRM1:check()'; -- ����� �� ��������� ��� ������

-- ����������
function _QuikRM1:val()
	local var_1 = _QuikUtilityRMSetting("_QuikRM1",2);
	local var_2 = 100-(_QuikGetRubDepo()/_QuikGetRubPrevDepo()*100);
	return {
		var_1,
		_QuikUtilityStrRound2(var_2,0)
	};
end;

-- ��������
function _QuikRM1:check()
	local vars = _QuikRM1:val();
	if vars[2] >= vars[1] then
		return 1;
	end;
	return 0;
end;