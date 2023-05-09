const printBtn = document.querySelector(".printBtn");

const nameProf = document.querySelector('.name_prof_btn .tn-atom').innerHTML;

const tableData = [  
  ['Крепление', 'Скрытое'],
  ['Вариант профиля', 'Bronze'],
  ['Количество вставок', '2'],
  ['Количество дверей', '3']
];

title = 'Расчет дверей';


printBtn.addEventListener('click', ()=>{
    




  // Create a new canvas element
  const canvas = document.createElement('canvas');
  canvas.width = 600; // Set the width of the canvas
  canvas.height = 1200; // Set the height of the canvas
  // Get the 2D context of the canvas
  const ctx = canvas.getContext('2d');
  // Define the columns and rows of the table
  const columns = ['Свойство', 'Значение'];
  const rows = tableData;
  // Set the width of the table columns
  const columnWidths = [400, 400];
  // Calculate the total width of the table
  const tableWidth = columnWidths.reduce((total, width) => total + width, 0);
  // Calculate the x-coordinate of the left edge of the table
  const tableX = (canvas.width - tableWidth) / 2;
  // Set the font properties
  ctx.font = 'bold 16px Arial';
  ctx.textAlign = 'center';
  // Draw the title above the table
  ctx.fillText(title, canvas.width / 2, 50);
  // Set the font properties for the table cells
  ctx.font = 'normal 12px Arial';
  ctx.textAlign = 'center';
  // Define the color gradient for the table rows
  const gradient = ctx.createLinearGradient(0, 0, 0, canvas.height);
  gradient.addColorStop(0, '#ffffff');
  gradient.addColorStop(1, '#f1f1f1');
  // Set the fill style for the table rows
  ctx.fillStyle = gradient;
  // Draw the table headers
  ctx.fillRect(tableX, 70, tableWidth, 20);
  ctx.fillStyle = '#000000';
  ctx.fillText(columns[0], tableX + columnWidths[0] / 2, 85);
  ctx.fillText(columns[1], tableX + columnWidths[0] + columnWidths[1] / 2, 85);
  // Draw the table rows
  let y = 100;
  for (let i = 0; i < rows.length; i++) {
  // Set the fill style for the current row
  ctx.fillStyle = i % 2 === 0 ? '#ffffff' : '#f7f7f7';
  ctx.fillRect(tableX, y, tableWidth, 20);
  // Draw the table cells
  ctx.fillStyle = '#000000';
  ctx.textAlign = 'left'; // Set the text alignment to left
  ctx.fillText(rows[i][0], tableX + columnWidths[0] / 2, y + 15);
  ctx.fillText(rows[i][1], tableX + columnWidths[0] + 10, y + 15); // Adjust the x-coordinate to align left
  ctx.textAlign = 'center'; // Set the text alignment back to center
  // Increment the y-coordinate for the next row
  y += 20;
}
  // Convert the canvas to an image
  const imgData = canvas.toDataURL('image/png');
  // Create a new image element
  const img = document.createElement('img');
  img.src = imgData;
  // Create a new window to display the image and print it
  const win = window.open();
  win.document.body.appendChild(img);
  win.print();

    
    // Create a new PDF document
    // window.jsPDF = window.jspdf.jsPDF;
    // var doc = new jsPDF('landscape');
    // doc.addFont(customFont.RobotoCyrillic-Regular.src, customFont.RobotoCyrillic-Regular.fontFamily, customFont.RobotoCyrillic-Regular.fontWeight, customFont.RobotoCyrillic-Regular.fontStyle);
    // doc.setFont(customFont.RobotoCyrillic-Regular.fontFamily);
    // doc.setFontSize(16);
    
    // Add some text to the document
    // doc.text('Варианты отделки профиля:', 10, 10);
    // doc.text(nameProf, 10, 20);
    
    
    // Print the document
    // doc.autoPrint();
    // doc.output('dataurlnewwindow');

    




    console.log('print');

})