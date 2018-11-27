<%-- 
  This file is included in all *.jsp files. It is specified by an include-prelude 
  option in web.xml.
  NOTE: Do not set a contentType directive in this file as some JSPs will render
  text/html, whereas others will render other mime types, including application/json.
--%>
<%-- JSTL --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- DSP --%>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>

<%-- JSON Rendering Taglib --%>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>

<%-- Fluoroscope Taglib --%>
<%@ taglib prefix="preview" uri="http://www.atg.com/taglibs/webui-preview_rt" %>

<%-- Endeca Taglib --%>
<%@ taglib prefix="endeca" uri="/endeca-infront-assembler/utilityTags" %>

<%-- Custom tag files --%>
<%@ taglib prefix="crs" tagdir="/WEB-INF/tags/store" %>

<dsp:page>
  
  <dsp:include page="/includes/availableAddOns.jsp"></dsp:include>
  
</dsp:page>
