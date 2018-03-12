<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>扫描仪</title>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
<meta http-equiv="Content-Language" content="en-us"/>
<meta http-equiv="X-UA-Compatible" content="requiresActiveX=true" />
<meta name="viewport" content="width=device-width, maximum-scale=1.0" />
<link href="Styles/style.css" type="text/css" rel="stylesheet" />
<script src="Scripts/common.js?t=170607"></script>
<script>
    if (dynamsoft.onlineNavInfo.deviceType == 'pc') {

    } else {

        var accept = confirm("Sorry, the demo is designed for web browsers on Windows PC or macOS only.\n\nYou are using a mobile device, would you like to visit our mobile camera web demo instead?");
	    if (accept) {
          window.location.replace("https://demo.dynamsoft.com/m/mobile-camera-web-capture.aspx");
        } else{/**/}
    }
    
</script>
<script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</script>
</head>

<body onpageshow="if (event.persisted) noBack();">
<div id="wrapper">
    <div class="DWTHeader">         
       <!--  <script src="Scripts/PageMenu.js?Type=0"></script> -->
        <!-- 页面菜单 -->
			<div id="divmenu">
				<div id="menu">
					<ul>
						<li class="D_menu_item_select" style="width: 100%"><a
							href="javaScript:void(0);">文档扫描</a></li>						
					</ul>
				</div>
			</div>
		<!-- 结束菜单 -->
		</div>
    <div id="DWTcontainer" class="container">
        <div id="DWTcontainerTop">
           <div id ="divEdit" class="divinput">
               <ul>
                    <!-- <li><img src="Images/ShowEditor.png" title= "Show Image Editor" alt="Show Image Editor" id="btnEditor" onclick="btnShowImageEditor_onclick()"/> </li> -->
                    <li><img src="Images/RotateLeft.png" title="Rotate Left" alt="Rotate Left" id="btnRotateL"  onclick="btnRotateLeft_onclick()"/> </li>
                    <li><img src="Images/RotateRight.png" title="Rotate Right" alt="Rotate Right" id="btnRotateR"  onclick="btnRotateRight_onclick()"/> </li>
                    <li><img src="Images/Rotate180.png" alt="Rotate 180" title="Rotate 180" onclick="btnRotate180_onclick()" /> </li>
                    <li><img src="Images/Mirror.png" title="Mirror" alt="Mirror" id="btnMirror"  onclick="btnMirror_onclick()"/> </li>
                    <li><img src="Images/Flip.png" title="Flip" alt="Flip" id="btnFlip" onclick="btnFlip_onclick()"/> </li>
                    <li><img src="Images/RemoveSelectedImages.png" title="Remove Selected Images" alt="Remove Selected Images" id="DW_btnRemoveCurrentImage" onclick="btnRemoveCurrentImage_onclick();"/></li>
                    <li><img src="Images/RemoveAllImages.png" title="Remove All Images" alt="Remove All Images" id="DW_btnRemoveAllImages" onclick="btnRemoveAllImages_onclick();"/></li>
                    <li style="height:57px;"><img src="Images/ChangeSize.png" title="Change Image Size" alt="Change Image Size" id="btnChangeImageSize" onclick="btnChangeImageSize_onclick();"/> </li>
                    <li> <img src="Images/Crop.png" title="Crop" alt="Crop" id="btnCrop" onclick="btnCrop_onclick();"/></li>
                </ul>
            </div>
            <div id="dwtcontrolContainer"></div>
            <div id="btnGroupBtm" class="clearfix"></div>
        </div>
        <div id="ScanWrapper">
            <div id="divScanner" class="divinput">
                <ul class="PCollapse">
                    <li>
                        <div class="divType">
                            <div class="mark_arrow expanded"></div>
                            Custom Scan</div>
                        <div id="div_ScanImage" class="divTableStyle">
                            <ul id="ulScaneImageHIDE" >
                                <li>
                                    <label for="source">
                                    <p>Select Source:</p>
                                    </label>
                                    <select size="1" id="source" style="position:relative;" onchange="source_onchange()">
                                        <option value = ""></option>
                                    </select>
                                </li>
                                <li style="display:none;" id="pNoScanner"> <a href="javascript: void(0)" class="ShowtblLoadImage" style="position:relative;color:red" id="aNoScanner"><b>(No TWAIN compatible drivers detected)</b></a></li>
                                <li id="divProductDetail"></li>
                                <li class="tc">
                                    <input id="btnScan" disabled="disabled" type="button" value="Scan" onclick ="acquireImage();"/>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="divType">
                            <div class="mark_arrow collapsed"></div>
                            Load Images or PDFs</div>
                        <div id="div_LoadLocalImage" style="display: none" class="divTableStyle">
                            <ul>
                                <li class="tc">
                                    <input class="btnOrg" type="button" value="Load" onclick="return btnLoadImagesOrPDFs_onclick()" />
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
            <div id="tblLoadImage" style="visibility:hidden; height:125px">
                <ul>
                    <li><b>You can:</b><a href="javascript: void(0)" style="text-decoration:none; padding-left:185px" class="ClosetblLoadImage">X</a></li>
                </ul>
                <div id="notformac1" style="background-color:#f0f0f0; padding:5px;">
                    <ul>
                        <li><img alt="arrow" src="Images/arrow.gif" width="9" height="12"/><b>Install a Virtual Scanner:</b></li>
                        <li style="text-align:center;"><a id="samplesource32bit" href="http://demo.dynamsoft.com/DWT/Sources/twainds.win32.installer.2.1.3.msi">32-bit Sample Source</a> <a id="samplesource64bit" style="display:none;" href="http://demo.dynamsoft.com/DWT/Sources/twainds.win64.installer.2.1.3.msi">64-bit Sample Source</a> from <a target="_blank" href="http://www.twain.org">TWG</a></li>
                    </ul>
                </div>
            </div>
            <div id="divUpload" class="divinput mt30" style="position:relative">
                <ul>
                    <li class="toggle">Save Documents</li>
                    <li>
                        <label for="txt_fileName">
                        <p>文件名称:</p>
                        </label>
                        <label>
                        <input type="text" size="20" id="txt_fileName1"/>      
                        </label>                  
                    </li>
                    <li style="padding-right:0;">
                       <!--  <label for="imgTypebmp">
                            <input type="radio" value="bmp" name="ImageType" id="imgTypebmp" onclick ="rd_onclick();"/>
                            BMP</label> -->
                        <label for="imgTypejpeg">
                            <input type="radio" value="jpg" name="ImageType" id="imgTypejpeg" onclick ="rd_onclick();"/>
                            JPEG</label>
                        <!-- <label for="imgTypetiff">
                            <input type="radio" value="tif" name="ImageType" id="imgTypetiff" onclick ="rdTIFF_onclick();"/>
                            TIFF</label>
                        <label for="imgTypepng">
                            <input type="radio" value="png" name="ImageType" id="imgTypepng" onclick ="rd_onclick();"/>
                            PNG</label> -->
                        <label for="imgTypepdf">
                            <input type="radio" value="pdf" name="ImageType" id="imgTypepdf" onclick ="rdPDF_onclick();"/>
                            PDF</label>
                    </li>
                    <li>
                       <!--  <label for="MultiPageTIFF">
                            <input type="checkbox" id="MultiPageTIFF"/>
                            Multi-Page TIFF</label> -->
                        <label for="MultiPagePDF">
                            <input type="checkbox" id="MultiPagePDF"/>
                            Multi-Page PDF</label>
                    </li>
                    <li>
                        <input id="btnSave" class="btnOrg" type="button" value="Save to Local" onclick ="saveUploadImage('local')"/>
                        <input id="btnUpload" class="btnOrg" type="button" value="Upload to Server" onclick ="saveUploadImage('server')"/>
                    </li>
                </ul>
            </div>
        </div>
       <!--  <div id="DWTcontainerBtm" class="clearfix">
            <div id="DWTemessageContainer"></div>
            <div id="divNoteMessage"> </div>
        </div>  -->
    </div>
    <div class="DWTTail"> 
        <!-- #include file=includes/PageTail.aspx --> 
    </div>
</div>
<div id="ImgSizeEditor" style="visibility:hidden; text-align:left;">
    <ul>
        <li>
            <label for="img_height">New Height :
                <input type="text" id="img_height" style="width:50%;" size="10"/>
                pixel</label>
        </li>
        <li>
            <label for="img_width">New Width :&nbsp;
                <input type="text" id="img_width" style="width:50%;" size="10"/>
                pixel</label>
        </li>
        <li>Interpolation method:
            <select size="1" id="InterpolationMethod">
                <option value = ""></option>
            </select>
        </li>
        <li style="text-align:center;">
            <input type="button" value="   OK   " id="btnChangeImageSizeOK" onclick ="btnChangeImageSizeOK_onclick();"/>
            <input type="button" value=" Cancel " id="btnCancelChange" onclick ="btnCancelChange_onclick();"/>
        </li>
    </ul>
</div>
<div class="narrow-screen">
    <div class="tips-header clearfix"> <a class="logo-dwt" href="http://www.dynamsoft.com/Products/WebTWAIN_Overview.aspx" target="_blank"> <img alt="Dynamic Web TWAIN logo" src="Images/logo-dwt-68x68.png"></a> <img class="img-onlineDemo" src="Images/img-onlineDemo-126x21.png" alt="Dynamic Web TWAIN onlineDemo"/> </div>
    <div class="tips-desktop"><img src="images/sc-desktop-only.png" border="0" alt="" width="280"/></div>
    <p class="tips">Sorry! <br />
        This page is an online demo of Dynamic Web TWAIN which runs in browsers on Windows and Mac OS X only, for now. Thanks! </p>
</div>

<script>
    window['bDWTOnlineDemo'] = true;
</script>
<script src="Scripts/jquery.js?t=170607"></script>
    
<script src="Resources/dynamsoft.webtwain.config.js?t=170607"></script>
<script src="Resources/dynamsoft.webtwain.initiate.js?t=170607"></script>
<script src="Resources/addon/dynamsoft.webtwain.addon.pdf.js?t=170607"></script>
    
<script src="Scripts/online_demo_operation.js?t=170607"></script>
<script src="Scripts/online_demo_initpage.js?t=170607"></script>

<script>
    $("ul.PCollapse li>div").click(function() {
        if ($(this).next().css("display") == "none") {
            $(".divType").next().hide("normal");
            $(".divType").children(".mark_arrow").removeClass("expanded");
            $(".divType").children(".mark_arrow").addClass("collapsed");
            $(this).next().show("normal");
            $(this).children(".mark_arrow").removeClass("collapsed");
            $(this).children(".mark_arrow").addClass("expanded");
        }
    });
</script> 
<script>
    // Assign the page onload fucntion.
    $(function() {
        pageonload();
    });
</script>
</body>
</html>