<!DOCTYPE html>
<html>
  <head>
    <title>Canvas to jspdf</title>
  </head>
  <body>
    <canvas id="canvas" width="300" height="200"></canvas>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    <script>
      const canvas = document.getElementById('canvas');
      const ctx = canvas.getContext('2d');
      
      ctx.font = '20px Arial';
      ctx.fillText('Hello, World!', 50, 100);
      
      const pdf = new jsPDF();
      const imgData = canvas.toDataURL('image/png');
      pdf.addImage(imgData, 'PNG', 10, 10, 100, 75);
      
      pdf.save('document.pdf');
    </script>
  </body>
</html>

//   var doc = new jsPDF();
//   doc.addFont('https://fonts.gstatic.com/s/montserrat/v15/JTUSjIg1_i6t8kCHKm459Wlhzg.ttf', 'Montserrat', 'normal');
//   doc.setFont('Montserrat');


//   const customFont = {
//   // The name you'll use to refer to the font
//   name: "myFont",
//   // The path to the font file
//   url: "https://fonts.gstatic.com/s/montserrat/v15/JTUSjIg1_i6t8kCHKm459Wlhzg.ttf",
//   // The font family name (optional)
//   family: "My Font",
// };

// // Add the font to jsPDF
// doc.addFont(customFont.url, customFont.name, "normal");
// doc.setFont(customFont.name, "normal");
// doc.setFontSize(12);

// var fontUrl = 'src/fonts/Montserrat-Regular.ttf';
// var fontUrl = 'https://fonts.gstatic.com/s/montserrat/v15/JTUSjIg1_i6t8kCHKm459Wlhzg.ttf';

// var fontLoadPromise = new Promise(function(resolve, reject) {
  //   var xhr = new XMLHttpRequest();
  //   xhr.open('GET', fontUrl, true);
  //   xhr.responseType = 'blob';
  //   xhr.onload = function() {
  //     if (xhr.status === 200) {
  //       var fontBlob = xhr.response;
  //       var fontUrl = URL.createObjectURL(fontBlob);
  //       doc.addFont(fontUrl, 'Montserrat', 'normal');
  //       resolve();
  //     } else {
  //       reject();
  //     }
  //   };
  //   xhr.onerror = function() {
  //     reject();
  //   };
  //   xhr.send();
  // });
  
  // fontLoadPromise.then(function() {
  
  
   
  //   doc.addFileToVFS("Montserrat-Regular.ttf", fontData);
  //   doc.addFont("Montserrat-Regular.ttf", "Montserrat", "normal", "Identity-H", "UTF-8");
  //    // Add some text to the document
  //    doc.text('Привет', 10, 20);
  //    doc.text('hi', 10, 10);
  //    doc.text('hello', 10, 10);
      
  //     // Print the document
  //     doc.autoPrint();
  //     doc.output('dataurlnewwindow');
  // }).catch(function() {
  //   console.log('Failed to load font');
  // });



  function printTableToPDF(tableData) {
    // Create a new PDF document with landscape orientation
    const doc = new jsPDF('landscape');
    // Define the columns and rows of the table
    const columns = ['Property', 'Value'];
    const rows = tableData;
    // Set the width of the table columns
    const columnWidths = [50, 100];
    // Add the table to the first page of the PDF document
    doc.autoTable({
      head: [columns],
      body: rows,
      columnWidths: columnWidths,
      bodyStyles: {
        valign: 'middle',
        halign: 'center'
      },
      cellStyles: {
        0: {fontWeight: 'bold'},
        1: {cellWidth: 'wrap'}
      }
    });
    // Add a second page to the PDF document
    doc.addPage();
    // Add content to the second page, if needed
    doc.text(20, 20, 'This is the second page.');
    // Save the PDF document
    doc.save('table.pdf');
  }
  