#include <avr/io.h>
#include <util/delay.h>

int main (void)
{
    // PB1 настроен на вывод
    DDRB |= (1 << PB1);
    
    while (1) {
        PORTB |= (1 << PB1);
        _delay_ms(100);
        PORTB &= ~(1 << PB1);
        _delay_ms(100);
    }
    return 0;
}
