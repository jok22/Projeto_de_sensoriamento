
///https://qastack.com.br/electronics/89/how-do-i-measure-the-rpm-of-a-wheel

int pin = 13; //pino de interrupção
float raio_polegada;
float raio_metro;
volatile unsigned int rpm; //contador de rpm
volatile unsigned long timeold; //tempo
volatile unsigned long rpmcount;

float velocidade;
unsigned int pulso_por_volta = 8; //furos no disco


void setup() {

  Serial.begin(250000); // Inicia a comunicacao serial 

  raio_polegada = 11;
  raio_metro = raio_polegada /39.37; //converte de polegada para metro
  
  rpm = 0;
  rpmcount = 0;
  velocidade = 0;
  
  timeold = millis();

  attachInterrupt(digitalPinToInterrupt(pin), interruptPin, FALLING); 
  
 
  
}

void loop() {

  //detachInterrupt(digitalPinToInterrupt(pin));
  
  if(millis() - timeold >= 500){
  
    
  
     rpm = (60*1000/pulso_por_volta)/(millis() - timeold)*rpmcount;
      
     velocidade = (2 * 3.6 * PI* raio_metro * rpm)/ 60;
     
     //velocidade = (2*PI*raio*rpm_true)/(1667); // cm/min --> km/h
 
     timeold = millis();
     rpmcount = 0;

  
    Serial.print("RPM:");
    Serial.println(rpm);
    Serial.print("Velocidade:");
    Serial.print(velocidade);
    Serial.println("KM/H");

    
   }
  
}
   

  
 
    
  //delay(100); // Tempo para atualizacao de informacoes


void interruptPin()
{
   rpmcount++;
}
