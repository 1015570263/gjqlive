// $Revision: 1.6 $
// v3.0.4
	// requires basic type functions ( basicType.js )
	/* ---------------- Common form operations/ --------------- */

	// function to check required form element
	function fn_CheckRequired ( theElement , theElementName )
	{
		/*
		if ( theElement == undefined )
		{
			alert ( "要求检查的项目（" + theElementName	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		theElement.value = trimString ( theElement.value ) ;
		if( theElement.value == "" )
		{
			alert( "\"" + theElementName + "\"" + "必须填写！" ) ;
			theElement.focus();
			return false ;
		}
		return true;
	}

	// function to check INT form element
	function fn_CheckIntNumber ( theElement , theElementName )
	{
		/*
		if ( theElement == undefined )
		{
			alert ( "要求检查的项目（" + theElementName	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		if( isNaN( parseInt ( theElement.value ) ) )
		{
			alert( "\"" + theElementName + "\"" + "不是一个有效的整数！" ) ;
			theElement.focus();
			return false ;
		}
		return true;
	}

	// function to check Float form element
	function fn_CheckFloatNumber ( theElement , theElementName )
	{
		/*
		if ( theElement == undefined )
		{
			alert ( "要求检查的项目（" + theElementName	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		if( isNaN( parseFloat ( theElement.value ) ) )
		{
			alert( "\"" + theElementName + "\"" + "不是一个有效的数字！" ) ;
			theElement.focus();
			return false ;
		}
		return true;
	}

	// function to check Email form element
	function fn_CheckEmail ( theElement , theElementName )
	{
		/*
		if ( theElement == undefined )
		{
			alert ( "要求检查的项目（" + theElementName	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		if( ! isEmail( theElement.value ) )
		{
			alert( "\"" + theElementName + "\"" + "不是一个有效的E-mail地址！" ) ;
			theElement.focus();
			return false ;
		}
		return true;
	}

	// function to check if 2 password match
	function fn_ValidatePassword ( thePassword1 , thePasswordName1 , thePassword2 , thePasswordName2 )
	{
		/*
		if ( thePassword1 == undefined )
		{
			alert ( "要求检查的项目（" + thePasswordName1	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		if ( thePassword2 == undefined )
		{
			alert ( "要求检查的项目（" + thePasswordName2	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		if ( thePassword1.value.length < 6 )
		{
			alert ( "\"" + thePasswordName1 + "\"至少要有6个字符！" ) ;
			thePassword1.value = "" ;
			thePassword1.focus ( ) ;
			return false ;
		}

		if ( thePassword2.value.length < 6 )
		{
			alert ( "\"" + thePasswordName2 + "\"至少要有6个字符！" ) ;
			thePassword2.value = "" ;
			thePassword2.focus ( ) ;
			return false ;
		}

		if ( thePassword1.value != thePassword2.value )
		{
			alert ( "两次输入的密码不符合！请重新输入。" )
			thePassword1.value = "" ;
			thePassword2.value = "" ;
			thePassword1.focus ( ) ;
			return false ;
		}
		return true ;
	}

	// function to check valid login name
	function fn_ValidateLoginName ( theElement , theElementName )
	{
		/*
		if ( theElement == undefined )
		{
			alert ( "要求检查的项目（" + theElementName	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		theElement.value = trimString ( theElement.value ) ;
		if ( theElement.value == "" )
		{
		  alert ( "\"" + theElementName + "\"必须填写！" ) ;
		  theElement.focus ( ) ;
		  return false ;
		}

		if ( ! fn_CheckLoginName ( theElement.value ) )
		{
			alert ( "\"" + theElementName + "\"中只能包含字母、数字和\"-\"，\".\"，\"_\"字符！并且不能以\"-\"，\".\"，\"_\"字符开头！" ) ;
			theElement.focus ( ) ;
			return false ;
		}
		return true ;
	}

	// function to check valid domain name
	function fn_ValidateDomainName ( theElement , theElementName )
	{
		theElement.value = trimString ( theElement.value ) ;
		if ( theElement.value == "" )
		{
		  alert ( "\"" + theElementName + "\"必须填写！" ) ;
		  theElement.focus ( ) ;
		  return false ;
		}

		if ( ! fn_CheckDomainName ( theElement.value ) )
		{
			alert ( "\"" + theElementName + "\"中只能包含字母、数字和\"-\"字符！并且不能以\"-\"字符开头！" ) ;
			theElement.focus ( ) ;
			return false ;
		}
		return true ;
	}

	function fn_ValidateDomainNameOnly ( theElement , theElementName )
	{
		/*
		if ( theElement == undefined )
		{
			alert ( "要求检查的项目（" + theElementName	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		theElement.value = trimString ( theElement.value ) ;
		theElement.value = theElement.value.toLowerCase() ;
		if ( theElement.value == "" )
		{
		  alert ( "\"" + theElementName + "\"必须填写！" ) ;
		  theElement.focus ( ) ;
		  return false ;
		}

		if ( ! fn_CheckDomainNameOnly ( theElement.value ) )
		{
			alert ( "\"" + theElementName + "\"中只能包含字母、数字和\"-\"字符！并且不能以\"-\"字符开头！" ) ;
			theElement.focus ( ) ;
			return false ;
		}
		return true ;
	}

	// function to check valid CN domain name
	function fn_ValidateCNDomainName ( theElement , theElementName )
	{
		theElement.value = trimString ( theElement.value ) ;
		if ( theElement.value == "" )
		{
		  alert ( "\"" + theElementName + "\"必须填写！" ) ;
		  theElement.focus ( ) ;
		  return false ;
		}

		if ( ! fn_CheckCNDomainName ( theElement.value ) )
		{
			alert ( "\"" + theElementName + "\"中只能包含中文、字母、数字和\"-\"字符，不能以\"-\"字符开头或结束，至少需要含有一个中文文字，最多不超过20个字符!" ) ;
			theElement.focus ( ) ;
			return false ;
		}
		return true ;
	}

	function fn_ValidateCNDomainNameOnly ( theElement , theElementName )
	{
		/*
		if ( theElement == undefined )
		{
			alert ( "要求检查的项目（" + theElementName	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		theElement.value = trimString ( theElement.value ) ;
		//theElement.value = theElement.value.toLowerCase() ;
		if ( theElement.value == "" )
		{
		  alert ( "\"" + theElementName + "\"必须填写！" ) ;
		  theElement.focus ( ) ;
		  return false ;
		}

		if ( ! fn_CheckCNDomainNameOnly ( theElement.value ) )
		{
			alert ( "\"" + theElementName + "\"中只能包含中文、字母、数字和\"-\"字符，不能以\"-\"字符开头或结束，至少需要含有一个中文文字，最多不超过20个字符!" ) ;
			theElement.focus ( ) ;
			return false ;
		}
		return true ;
	}

	// function to check valid ip address
	function fn_ValidateIPAddress ( theElement , theElementName )
	{
		/*
		if ( theElement == undefined )
		{
			alert ( "要求检查的项目（" + theElementName	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		theElement.value = trimString ( theElement.value ) ;
		if ( theElement.value == "" )
		{
		  alert ( "\"" + theElementName + "\"必须填写！" ) ;
		  theElement.focus ( ) ;
		  return false ;
		}

		if ( ! isIPAddress ( theElement.value ) )
		{
			alert ( "\"" + theElementName + "\"不是合法的IP地址！" ) ;
			theElement.focus ( ) ;
			return false ;
		}
		return true ;
	}

	// function to check valid ip address Group
	function fn_ValidateIPAddressGroup ( theElement1 , theElementName1 , theElement2 , theElementName2 )
	{
		/*
		if ( theElement1 == undefined )
		{
			alert ( "要求检查的项目（" + theElementName1	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		if ( theElement2 == undefined )
		{
			alert ( "要求检查的项目（" + theElementName2	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		theElement1.value = trimString ( theElement1.value ) ;
		if ( theElement1.value == "" )
		{
		  alert ( "\"" + theElementName1 + "\"必须填写！" ) ;
		  theElement1.focus ( ) ;
		  return false ;
		}

		if ( ! isIPAddress ( theElement1.value ) )
		{
			alert ( "\"" + theElementName1 + "\"不是合法的IP地址！" ) ;
			theElement1.focus ( ) ;
			return false ;
		}

		theElement2.value = trimString ( theElement2.value ) ;
		if ( theElement2.value == "" )
		{
		  alert ( "\"" + theElementName2 + "\"必须填写！" ) ;
		  theElement2.focus ( ) ;
		  return false ;
		}

		if ( ! isIPAddress ( theElement2.value ) )
		{
			alert ( "\"" + theElementName2 + "\"不是合法的IP地址！" ) ;
			theElement2.focus ( ) ;
			return false ;
		}
		return true ;
	}

	// function to check or uncheck all checkbox elements of a form by a select-all checkbox value
	function fn_ChangeSelectAll( theForm , bSelected )
	{
		/*
		if ( theForm == undefined )
		{
			alert ( "要求填写的表单（" + theElementName	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		for ( i = 0 ; i < theForm.elements.length ; i ++ )
		{
			obj = theForm.elements[i] ;
			if ( obj.type == "checkbox" )
			{
				obj.checked = bSelected ;
			}
		}
	}

	// function to set selected option of select form element by given option value
	function fn_FillSelectInput ( theSelectInput , strSelectedValue )
	{
		/*
		if ( theSelectInput == undefined )
		{
			alert ( "要求填写的表单列表并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		for ( i = 0 ; i < theSelectInput.length ; i ++ )
		{
			if ( theSelectInput.options [ i ].value == strSelectedValue )
			{
				theSelectInput.options[i].selected = true ;
				break ;
			}
		}
	}

	// function to build select input options of an object list
	function fn_BuildOptions( nTotalCount , nItemPerPage , nStartItem )
	{
		if( nItemPerPage == -1 )
			return "<option value=\"1\" selected>第1页</option>";

		nPages = Math.ceil( Number( nTotalCount ) / Number ( nItemPerPage ) ) ;

		nPage = Math.ceil( Number( nStartItem ) / Number ( nItemPerPage ) ) ;

		if( nPages > 1 )
		{
			strReturn = "<option value=\"1\">最前页</option>" ;
		}else
		{
			strReturn = "" ;
		}

		if( nPage > 10 )
		{
			strReturn += "<option value=\"" + (nPage-1) + "\">前10页</option>" ;
			nStart = nPage-1 ;
		}else
		{
			nStart = 0 ;
		}

		nEnd = Math.min( nPages , nStart + 10 ) ;
		//alert(nStart);
		//alert(nEnd);
		for( nLoopCount = nStart ; nLoopCount < nEnd ; nLoopCount++ )
		{
			strReturn += "<option value=\"" + (nLoopCount+1) + "\"" ;

			if( nLoopCount == nPage-1 )
				strReturn += " selected " ;

			strReturn += ">第" + (nLoopCount+1) + "页</option>" ;
		}

		if( nPages > nEnd )
		{
			strReturn += "<option value=\"" + (nEnd+1) + "\">后10页</option>" ;
		}

		if( nPages > 1 )
		{
			strReturn += "<option value=\"" + nPages + "\">最后页</option>" ;
		}

		return strReturn;
	}

	function fn_IsFormChanged( theForm )
	{
		/*
		if ( theForm == undefined )
		{
			alert ( "要求检查的表单（" + theElementName	+ "）并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		var i;
		var obj;
		for( i=0; i<theForm.elements.length; i++ )
		{
			obj = theForm.elements[i];
			if( obj.type == "text" || obj.type == "password" || obj.type == "textarea" )
			{
				if( obj.value != obj.defaultValue )
					return true;
			}else if( obj.type == "checkbox" )
			{
				if( obj.checked != obj.defaultChecked )
					return true;
			}else if( obj.type == "select-one" )
			{
				if( !obj.options[obj.selectedIndex].defaultSelected )
					return true;
			}else if( obj.type == "radio" )
			{
				if (obj.defaultChecked!=obj.checked)
				{
					return true;
				}
			}
		}

		return false;
	}

	function fn_FillRadioInput ( theRadioInput , strSelectedValue )
	{
		/*
		if ( theSelectInput == undefined )
		{
			alert ( "要求填写的表单列表并不是一个有效的JavaScript对象" ) ;
			return false;
		}
		*/
		for ( i = 0 ; i < theRadioInput.length ; i ++ )
		{
			if ( theRadioInput [ i ].value == strSelectedValue )
			{
				theRadioInput[i].checked = true ;
				break ;
			}
		}
	}

    function fn_BuildSelectOptions(theSelect,theOptions,theDefaultValue)
    {
    	while ( theSelect.options.length > 0 && theSelect.options[theSelect.options.length-1].value != "" )
    		theSelect.options[theSelect.options.length-1] = null;

    	for (var i=0; theOptions[i] && theOptions[i+1]; i+=2)
    	{
    		theSelect.options[theSelect.options.length] = new Option(theOptions[i+1]);
    		theSelect.options[theSelect.options.length-1].value = theOptions[i];
    		if ( theOptions[i] == theDefaultValue )
    		{
    		    theSelect.options[theSelect.options.length-1].selected = 1;
    		}
    	}
    }

    function isTelephone(str)
    {
    	regExp = /^[0-9]+(\-[0-9]+){1,2}$/ ;
    	return regExp.test ( str ) ;
    }

    function isPostcode(str)
    {
    	regExp = /^[0-9]{6,6}$/ ;
    	return regExp.test ( str ) ;
    }

    function fn_DoDefaultSelect ( theSelect , theDefaultValue )
    {
        if ( theSelect )
        {
            for ( var i=0; i<theSelect.options.length; i++ )
            {
                if ( theSelect.options[i].value == theDefaultValue )
                {
                    theSelect.selectedIndex = i ;
                    break;
                }
            }
        }
    }
    
    function isMobile(str)
    {
    	regExp = /^[0-9]{11,11}$/ ;
    	return regExp.test ( str ) ;
    }

    function isIDNumber(str)
    {
    	regExp1 = /^[0-9]{17,17}[0-9xX]$/ ;
    	regExp2 = /^[0-9]{15,15}$/ ;
    	return (regExp1.test ( str ) || regExp2.test ( str ));
    }

	/* ---------------- /Common form operations --------------- */
