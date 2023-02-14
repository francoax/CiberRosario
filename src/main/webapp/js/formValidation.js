const validateForm = (formSelector) => {
        const formElement = document.querySelector(formSelector);

        const validationOptions = [
            {
                attribute : 'minlength',
                isValid : input => input.value && input.value.length >= parseInt(input.minLength, 10),
                errorMessage : (input, label) => `${label.textContent} debe tener almenos ${input.minLength} caracteres.`
            },
            {
                attribute : 'custommaxlength',
                isValid : input => input.value && input.value.length <= parseInt(input.getAttribute('custommaxlength'), 10),
                errorMessage : (input, label) => `${label.textContent} no puede superar los ${input.getAttribute('custommaxlength')} caracteres.`
            },
            {
                attribute : 'pattern',
                isValid : input => {
                    const patternRegex = new RegExp(input.pattern);
                    return patternRegex.test(input.value);
                },
                errorMessage : (input, label) => `No es un ${label.textContent} válido.`
            },
            {
                attribute : 'match',
                isValid : input => {
                    const matchSelector = input.getAttribute('match');
                    const matchedElement = document.querySelector(`#${matchSelector}`);
                    return matchedElement && matchedElement.value.trim() === input.value.trim()
                },
                errorMessage : (input, label) => {
                    const matchSelector = input.getAttribute('match');
                    const matchedElement = document.querySelector(`#${matchSelector}`);
                    const matchedLabel = matchedElement.parentElement.parentElement.parentElement.parentElement.querySelector('label');

                    return `${label.textContent} debe coincidir con ${matchedLabel.textContent}`
                }
            },
            {
                attribute : 'required',
                isValid : input => input.value.trim() !== '',
                errorMessage : (input, label) => `${label.textContent} es requerido.`
            },
        ];
        
        const validateSingleFormGroup = formGroup => {
            const label = formGroup.querySelector('label');
            const input = formGroup.querySelector('input');
            const errorIcon = formGroup.querySelector('.error-icon')
            const successIcon = formGroup.querySelector('.success-icon');
            const helpContainer = formGroup.querySelector('.help');

            let formGroupError = false;
            for (let option of validationOptions) {
                if(input.hasAttribute(option.attribute) && !option.isValid(input)){
                    helpContainer.classList.add('is-danger');
                    input.classList.add('is-danger');
                    errorIcon.classList.remove('is-hidden');
                    input.classList.remove('is-success');
                    successIcon.classList.add('is-hidden');
                    helpContainer.textContent = option.errorMessage(input, label);
                    formGroupError = true;
                }
            }
            if(!formGroupError) {
                helpContainer.classList.remove('is-danger');
                input.classList.remove('is-danger');
                errorIcon.classList.add('is-hidden');
                helpContainer.textContent = '';
                input.classList.add('is-success');
                successIcon.classList.remove('is-hidden');
            }

            return !formGroupError;
        }

        formElement.setAttribute('novalidate', '');

        Array.from(formElement.elements).forEach(element => {
            element.addEventListener('blur', event => {
                validateSingleFormGroup(event.srcElement.parentElement.parentElement.parentElement.parentElement);
            })
        })

        const validateAllFormGroups = formToValidate => {
            const formGroups = Array.from(formToValidate.querySelectorAll('.formGroup'));
            return formGroups.every(formGroup => validateSingleFormGroup(formGroup));
        };

        formElement.addEventListener('submit', (e) => {
            const formValid = validateAllFormGroups(formElement);

            if(!formValid){
                e.preventDefault();
            } else {
                console.log('form valid');
            }
        });
};

/* const sendForm = (formElement) => {
    const formObject = Array.from(formElement.elements)
        .filter(element => element.type !== 'submit')
        .reduce((accumulator, element) => ({...accumulator, [element.id] : element.value}), {});
    
    console.log(formObject);
} */


validateForm('#signupForm')