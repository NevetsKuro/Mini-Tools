<html>
    <head>
        <title>Barcode Reader</title>
        <!--<link href="resources/css/infragistics.css" rel="stylesheet" type="text/css"/>-->
        <link href="http://cdn-na.infragistics.com/jquery/20132/latest/css/structure/infragistics.css" rel="stylesheet"/>
    </head>
    <body>
    <form id="businessCardInfo">
    <fieldset id="field" style="float: left;width: auto">
        <legend>Personal Information</legend>
            <label>Prefix:</label>
            <br>
            <input id="textEditor" type="text" name="prefix" title="Mrs, Miss, Dr ...">
            <br>
            <label><span class="req">* </span>First Name:</label>
            <br>
            <input id="textEditor1" type="text" name="firstName" title="first name" required>
            <br>
            <label>Middle Name:</label>
            <br>
            <input id="textEditor2" type="text" name="middleName" title="first name">
            <br>
            <label><span class="req">* </span>Last Name:</label>
            <br>
            <input id="textEditor3" type="text" name="secondName" title="second name" required>
            <br>
            <label>E-mail:</label>
            <br>
            <input class="output" id="textEditor4" type="text" name="email" title="example@example.com">
            <br>
            <label>Phone(Home):</label>
            <br>
            <input class="output" id="textEditor5" type="text" name="usrtel" title="555-555-555">
            <br>
            <label>Mobile:</label>
            <br>
            <input class="output" id="textEditor6" type="text" name="mobile" title="555-555-555">
            <br>

    </fieldset>
    <fieldset id="field2" style="float: left;width: auto">
        <legend>Office Information</legend>
            <label>Organization:</label>
            <br>
            <input class="output" id="textEditor7" type="text" name="companyName" title="Company name">
            <br>
            <label>Job Title :</label>
            <br>
            <input class="output" id="textEditor8" type="text" name="position" title="Job title like: CEO, Software Engineer,...">
            <br>
            <label>Business E-mail:</label>
            <br>
            <input class="output" id="textEditor9" type="text" name="email" title="example@example.com">
            <br>
            <label>Business Phone:</label>
            <br>
            <input class="output" id="textEditor10" type="text" name="usrtel" title="555-555-555">
            <br>
            <label>Fax:</label>
            <br>
            <input class="output" id="textEditor17" type="text" name="usrtel" title="555-555-555">
            <br>
            <label>Website:</label>
            <br>
            <input class="output" id="textEditor11" type="text" name="homepage" title="www.example.com">
            <br>
    </fieldset>
        <fieldset id="field3" style="float: left;width: auto">
        <legend>Office Address</legend>
            <label>Street:</label>
            <br>
            <input id="textEditor13" type="text" name="street">
            <br>
            <label>City:</label>
            <br>
            <input id="textEditor14" type="text" name="city">
            <br>
            <label>State/Province:</label>
            <br>
            <input id="textEditor15" type="text" name="state">
            <br>
            <label>Country:</label>
            <br>
            <input id="textEditor12" type="text" name="country">
            <br>
            <label>Zip/Postal Code:</label>
            <br>
            <input id="textEditor16" type="text" name="zipcode">
    </fieldset>
    <br>
    <button id="generateBC" value="GenerateBarcode">Generate Barcode</button>
</form>
<div id="options">
    <p>Choose width for the barcode</p>
    <input type="text" name="dimension">
    <button id="submit" value="SetDim">Submit</button>
</div>
<div id="barcode"></div>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="resources/js/infragistics.core.js" type="text/javascript"></script>
<script src="resources/js/infragistics.dv.js" type="text/javascript"></script>
<script src="http://cdn-na.infragistics.com/jquery/20132/latest/js/infragistics.lob.js" type="text/javascript"></script>
</body>
</html>