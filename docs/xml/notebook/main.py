import xml.etree.ElementTree as ET


class XMLElement:
    def __init__(self, xml: ET.Element):
        self.xml = xml

    def str(self, name: str) -> str | None:
        element = self.xml.find(name)
        return element.text if element is not None else None

    def int(self, name: str) -> int | None:
        element = self.xml.find(name)
        return int(element.text) if element is not None else None

    def float(self, name: str) -> float | None:
        element = self.xml.find(name)
        return float(element.text) if element is not None else None

    def bool(self, name: str) -> bool | None:
        element = self.xml.find(name)
        return bool(element.text) if element is not None else None


class XMLComplexeElement(XMLElement):
    def donnee_entree(self) -> XMLElement:
        return XMLElement(self.xml.find("donnee_entree"))

    def donnee_intermediaire(self) -> XMLElement:
        return XMLElement(self.xml.find("donnee_intermediaire"))


class XMLCaracteristiqueGenerale(XMLElement):
    pass


class XMLMeteo(XMLElement):
    pass


class XMLGeolocalisation(XMLElement):
    pass


class XMLAdministratif(XMLElement):
    def geolocalisation(self) -> XMLGeolocalisation:
        return XMLGeolocalisation(self.xml.find("geolocalisation"))

    def annee_etablissement(self) -> int:
        date_etablissement = self.str("date_etablissement_dpe") or self.str(
            "date_etablissement_audit"
        )
        return int(date_etablissement.split("-")[0])


class XMLEnveloppe(XMLElement):
    pass


class XMLClimatisation(XMLElement):
    pass


class XMLVentilation(XMLComplexeElement):
    pass


class XMLLogement(XMLElement):
    def caracteristique_generale(self) -> XMLCaracteristiqueGenerale:
        return XMLCaracteristiqueGenerale(self.xml.find("caracteristique_generale"))

    def meteo(self) -> XMLMeteo:
        return XMLMeteo(self.xml.find("meteo"))

    def climatisation_collection(self) -> list[XMLClimatisation]:
        return [XMLClimatisation(elem) for elem in self.xml.findall(".//climatisation")]

    def ventilation_collection(self) -> list[XMLVentilation]:
        return [XMLVentilation(elem) for elem in self.xml.findall(".//ventilation")]


class XMLRessource(XMLElement):
    def administratif(self) -> XMLAdministratif:
        return XMLAdministratif(self.xml.find("administratif"))

    def logement(self) -> XMLLogement:
        return XMLLogement(self.xml.find("logement"))


def fake() -> XMLRessource:
    tree = ET.parse("./example.xml")
    root = tree.getroot()
    return XMLRessource(root)
