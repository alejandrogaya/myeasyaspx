const date = new Date();
const today = {
    'date': date.getDate(),
    'month': date.getMonth(),
    'year': date.getFullYear()
};
let actualMonth = document.getElementsByClassName('actual-month')[0];
let divDays = document.getElementsByClassName('days')[0];

const nextMonth = document.getElementById('next-month');
const previousMonth = document.getElementById('previous-month');


// ADDING EVENTLISTENERS TO SHOW/HIDE MESSAGE
const messages = document.getElementsByClassName('messages');
const messages_array = [...messages];

let buttons = [];
messages_array.forEach(e => {
    if (e.children[4]) buttons.push(e.children[4]);
});

buttons.forEach(b => {
    b.addEventListener('click', () => {
        openMessage(b);
    });
});


// ADDING EVENTLISTENERS TO DELETE MESSAGE
const deleteButtonMessage = document.querySelectorAll(".message-content .btn-container .delete-message");
deleteButtonMessage.forEach(b => {
    b.addEventListener('click', () => {
        deleteMessage(b);
    });
});




nextMonth.addEventListener('click', () => {
    setCalendar(1);
});

previousMonth.addEventListener('click', () => {
    setCalendar(-1);
});

const deleteMessage = b => {
    b.parentElement.parentElement.previousElementSibling.remove();
    b.closest("div.message-content").remove(); 
}

const openMessage = b => {
    message = b.closest("div");
    if (b.classList.contains('open')) {
        b.classList.remove('open');

        if (message.nextElementSibling.classList.contains('message-content')) {
            message.nextElementSibling.style = "display: none;";    
        }
        
    } else {
        b.classList.add('open');

        if (message.nextElementSibling.classList.contains('message-content')) {
            message.nextElementSibling.style = "display: block;";    
        }
    }
}


const setCalendar = (modifiedMonth = null) => {
    let month;
    let year;

    if (modifiedMonth) date.setMonth(date.getMonth() + modifiedMonth);

    month = getMonth(date.getMonth());
    year = date.getFullYear();

    lastDayMonth = getLastDayOfMonth(date);
    firstDayMonth = getFirstDayOfMonth(date);

    actualMonth.innerHTML = `<b>${month.toUpperCase()} ${year}</b>`;

    divDays.innerHTML = '';

    dateNumber = 1;
    lastDayMonth += firstDayMonth;
    i = 0;
    while (i < lastDayMonth) {

        if (i < firstDayMonth) {
            divDays.innerHTML += `
                <div class="day">
                    <span></span>
                </div>
            `;
        } else {
            divDays.innerHTML += `
                <div class="day ${(dateNumber === today.date && date.getMonth() === today.month && date.getFullYear() === today.year) ? 'actual-day' : ''}">
                    <span>${dateNumber}</span>
                </div>
            `;
            dateNumber++;
        }
        i++;
    }

};



const getLastDayOfMonth = (date) => {
    const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
    return lastDay.getDate();
};

const getFirstDayOfMonth = (date) => {
    const firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
    return firstDay.getDay();
};

const getMonth = (monthNumber) => {
    switch (monthNumber) {
        case 0:
            return "January";
            break;
        case 1:
            return "February";
            break;
        case 2:
            return "March";
            break;
        case 3:
            return "April";
            break;
        case 4:
            return "May";
            break;
        case 5:
            return "June";
            break;
        case 6:
            return "July";
            break;
        case 7:
            return "August";
            break;
        case 8:
            return "September";
            break;
        case 9:
            return "October";
            break;
        case 10:
            return "November";
            break;
        case 11:
            return "December";
            break;
        default:
            break;
    }
};


//UNUSED
const getDay = (dayNumber) => {
    switch (dayNumber) {
        case 0:
            return "Sunday";
            break;
        case 1:
            return "Sunday";
            break;
        case 2:
            return "Tuesday";
            break;
        case 3:
            return "Wednesday";
            break;
        case 4:
            return "Thursday";
            break;
        case 5:
            return "Friday";
            break;
        case 6:
            return "Saturday";
            break;
        default:
            break;
    }
};

setCalendar();