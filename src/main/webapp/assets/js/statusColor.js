let  status = document.querySelectorAll('.span-status')

status.forEach(status => {
    switch(status.textContent){
        case 'refused':
            status.classList.add('bg-red-600')
            break;
        case 'accepted':
            status.classList.add('bg-green-600')
            break;
        case 'pending':
            status.classList.add('bg-yellow-400')
            break;
        case 'not-checked':
            status.classList.add('bg-orange-600')
            break;
    }
})