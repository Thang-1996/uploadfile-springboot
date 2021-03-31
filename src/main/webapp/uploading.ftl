<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body onload="uploadSize()">
<form name="uploadForm" enctype="multipart/form-data" action="/" method="POST">
    <p>
        <input id="fileInput" type="file" name="uploadingFiles"
               onchange="uploadSize()" multiple>
        File selected : <span id="fileNum">0</span>
        Total Size : <span id="fileSize">0</span>

    </p>
    <p>
        <input type="submit" value="UploadFile">
    </p>
</form>
    <div>
        Uploaded Files :
        <#list files as file>
            <div>
                ${file.getName()}
            </div>
        </#list>
    </div>
<script>
    function uploadSize() {
        let nBytes = 0,
            oFiles = document.querySelector("#fileInput").files,
            nFiles = oFiles.length;
        for (let nFileId = 0; nFileId < nFiles; nFileId++) {
            nBytes += oFiles[nFileId].size;
        }

        let sOutput = nBytes + " bytes";
// optional code for multiples approximation
        for (let aMultiples = ["KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB"], nMultiple = 0, nApprox = nBytes / 1024; nApprox > 1; nApprox /= 1024, nMultiple++) {
            sOutput = nApprox.toFixed(3) + " " + aMultiples[nMultiple] + " (" + nBytes + " bytes)";
        }
// end of optional code

        document.querySelector("#fileNum").innerHTML = nFiles;
        document.querySelector("#fileSize").innerHTML = sOutput;
    }
</script>
</body>
</html>