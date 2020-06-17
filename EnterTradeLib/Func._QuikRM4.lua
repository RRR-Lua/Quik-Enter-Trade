-- ����� �4 ���� ���� < 0,2% �� ��������� �����������
-- ��������� ���� �������� �������� @ �����. ��������� �����������
_QuikRM4 = {};
_QuikRM4_doc = "_QuikRM4(code, sl_test)"; -- ������������
_QuikRM4_name = "����������� ������ ����� � \"%\" �� ��������� �����������"; -- ��������

-- ������
function _QuikRM4:cell()
	local s2 = _QuikUtilityRMSetting("_QuikRM4",2);
	local calc = (_QuikGetMaxQtyByIndex(TRANS_SECCODE)/100)*s2;
	return tostring("��� ��� ���� < "..s2.."%");
end;

-- ��������
function _QuikRM4:check(code, sl_test)
	if code == "UpdateTableGlobalVar" then
		code = TRANS_SECCODE;
		sl_test = VAL_SL;
	end;
	
	local s2 = _QuikUtilityRMSetting("_QuikRM4",2);
	local calc = (_QuikGetParamExByIndex(code,'LAST')/1000)*s2 ;
	local min_step = _QuikGetParamExByIndex(code,'SEC_PRICE_STEP');
	
	if sl_test-min_step < calc then
		return 1;
	end;
	return 0;
end;