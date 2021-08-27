let unblocked = [
    'Andrew Kirby',
    'Elliot Choy',
    'Lex Fridman',
]

var everything = document.querySelectorAll('#details')

var valid = []

for (let i = 0; i < everything.length; i++) {
    if (i != 0) {

        var link = document.getElementById('avatar-link')
        var channelName = link.getAttribute('title')
        let faux = false
        for (const name of unblocked) {
            console.log(name)
            console.log(channelName)
            if (channelName === name) {
                faux = true
            }
        }
        var parentEl = link.parentElement; 
        var bigBoi = parentEl.parentElement; 
        if (faux === false) {
            bigBoi.innerHTML = '';
        } else {
            valid.push(bigBoi)
            bigBoi.innerHTML = '';
        }
    }
}

body = document.querySelector('body')
for (const el in valid) {
    body.appendChild(el)
}
