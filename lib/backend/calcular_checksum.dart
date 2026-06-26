import 'package:checksumcalculator/checksumcalculator.dart';

class CalcularChecksum {
  Future<void>calcularChecksumProtocoloZH(String comando) async { 
    String comandoSemCabecalho = comando.split("ZH+")[1].toString();
    List<String> paresBytes = separadorDeBytes(comando: comandoSemCabecalho);
    int soma = somaDaListaParesBytes(paresBytes: paresBytes);
    int resultadoComplemento = complementoDeDois(soma: soma);
    String checksum = calcularChecksum(resultadoComplemento: resultadoComplemento);
    print("O checksum do comando $comando é: $checksum");
  }
}