#!/bin/bash

# ==========================================
# RENK TANIMLARI (ANSI 256 Color)
# ==========================================
BOLD='\033[1m'
DIM='\033[2m'
CYAN='\033[38;5;51m'
PURPLE='\033[38;5;141m'
GREEN='\033[38;5;82m'
YELLOW='\033[38;5;226m'
RED='\033[38;5;196m'
GRAY='\033[38;5;240m'
NC='\033[0m'

# ==========================================
# AÇILIŞ VE YÜKLEME ANİMASYONU
# ==========================================
boot_animation() {
    clear
    echo -e "${PURPLE}"
    echo "  ██████╗███╗   ███╗██████╗ ███╗   ██╗"
    echo "  ██╔════╝████╗ ████║██╔══██╗████╗  ██║"
    echo "  █████╗  ██╔████╔██║██████╔╝██╔██╗ ██║"
    echo "  ██╔══╝  ██║╚██╔╝██║██╔══██╗██║╚██╗██║"
    echo "  ███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║"
    echo "  ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝"
    echo -e "${NC}"
    echo -e "${CYAN}${BOLD}           [ Em4nn Hacking UI ]${NC}\n"
    
    echo -n -e "  ${DIM}Arayüz modülleri yükleniyor: ${NC}["
    for i in {1..20}; do
        echo -n -e "${GREEN}█${NC}"
        sleep 0.02
    done
    echo -e "] ${GREEN}OK!${NC}\n"
    sleep 0.3
}

# ==========================================
# SİSTEM BİLGİ PANELİ
# ==========================================
show_info() {
    local date_str=$(date +"%d %B %Y %H:%M:%S")
    local host_str=$(hostname)

    echo -e "${GRAY}┌──────────────────────────────────────────────────────────┐${NC}"
    echo -e "${GRAY}│${NC} ${CYAN}Tarih & Saat :${NC} $date_str"
    echo -e "${GRAY}│${NC} ${CYAN}Cihaz Adı    :${NC} $host_str"
    echo -e "${GRAY}└──────────────────────────────────────────────────────────┘${NC}\n"
}

# ==========================================
# MENÜ
# ==========================================
menu() {
    echo -e "${PURPLE}${BOLD}  ═══ YÖNTEMLERİ SEÇİN ═══${NC}\n"

    echo -e "  ${RED}[1]${NC} [Boş / İleride Eklenecek]"
    echo -e "  ${RED}[2]${NC} [Boş / İleride Eklenecek]"
    echo -e "  ${RED}[3]${NC} [Boş / İleride Eklenecek]"
    echo -e "  ${RED}[4]${NC} Güncel Yardım Paneli"
    echo -e "  ${RED}[5]${NC} Em4nn Server System Checker [Aktif Değil]"
    echo -e "  ${RED}[6]${NC} Ping Testi"
    echo -e "  ${RED}[7]${NC} Traceroute"
    echo -e "  ${RED}[8]${NC} Port Tarama (Nmap)"
    echo -e "  ${RED}[9]${NC} Email Sorgulama"
    echo -e "  ${RED}[10]${NC} IP / GeoIP Bilgisi"
    echo -e "  ${RED}[11]${NC} Domain / Subdomain Sorgusu"
    echo -e "  ${RED}[12]${NC} CPU / RAM Durumu"
    echo -e "  ${RED}[13]${NC} Disk Kullanımı"
    echo -e "  ${RED}[14]${NC} Ağ Trafiği İzleme"
    echo -e "  ${RED}[15]${NC} Link Kısaltma / QR Kod Oluşturma"
    echo -e "  ${RED}[16]${NC} t.me/em4nhackingui"
    echo -e "  ${RED}[99]${NC} Gerekli kütüphaneleri Yükle"
    echo -e "  ${RED}[0]${NC} Çıkış"
    echo
    echo -e "${GRAY}──────────────────────────────────────────────────────────${NC}"
}

# İlk açılış animasyonu
boot_animation

# Ana Döngü
while true; do
    clear
    echo -e "${CYAN}${BOLD}=== Em4nn Hacking UI ===${NC}\n"
    show_info
    menu
    
    read -p "Seçiminiz >> " choice
    echo

    case $choice in
        1|2|3)
            echo -e "${YELLOW}Bu modül henüz eklenmedi veya boş bırakıldı.${NC}"
            read -p "Devam etmek için Enter..."
            ;;
        4)
            echo -e "${PURPLE}──────────────────────${NC}"
            echo -e "⚡️  ÜCRETSİZ YARDIM VE BİLGİ PANELİ"
            echo -e "${PURPLE}──────────────────────${NC}"
            echo -e "En Güncel Duyurular: t.me/em4nhackingui"
            read -p "Devam etmek için Enter..."
            ;;
        5)
            echo -e "${YELLOW}Em4nn Server System Checker şu an aktif değil.${NC}"
            read -p "Devam etmek için Enter..."
            ;;
        6)
            read -p "Hedef IP veya domain: " target
            ping -c 4 "$target"
            read -p "Devam etmek için Enter..."
            ;;
        7)
            read -p "Hedef IP veya domain: " target
            traceroute "$target"
            read -p "Devam etmek için Enter..."
            ;;
        8)
            read -p "Hedef IP veya domain: " target
            nmap -A "$target"
            read -p "Devam etmek için Enter..."
            ;;
        9)
            read -p "Email adresi girin: " email
            if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$ ]]; then
                echo -e "${GREEN}Email formatı geçerli: $email${NC}"
            else
                echo -e "${RED}Geçersiz email formatı!${NC}"
            fi
            read -p "Devam etmek için Enter..."
            ;;
        10)
            read -p "IP adresi girin: " ipaddr
            curl -s ipinfo.io/"$ipaddr"
            echo
            read -p "Devam etmek için Enter..."
            ;;
        11)
            read -p "Domain girin: " domain
            whois "$domain"
            read -p "Devam etmek için Enter..."
            ;;
        12)
            echo -e "${PURPLE}────────────────────────${NC}"
            echo -e "${GREEN}📊 CPU & RAM Durumu${NC}"
            echo -e "${PURPLE}────────────────────────${NC}"
            top -b -n 1 | head -n 15
            echo -e "${PURPLE}────────────────────────${NC}"
            read -p "Devam etmek için Enter..."
            ;;
        13)
            echo -e "${PURPLE}────────────────────────${NC}"
            echo -e "${GREEN}💾 Disk Kullanımı${NC}"
            echo -e "${PURPLE}────────────────────────${NC}"
            df -h | awk 'NR==1 || $6=="/" || $6=="/home"{print}'
            echo -e "${PURPLE}────────────────────────${NC}"
            read -p "Devam etmek için Enter..."
            ;;
        14)
            echo -e "${PURPLE}────────────────────────${NC}"
            echo -e "${GREEN}🌐 Ağ Trafiği İzleme (iftop)${NC}"
            echo -e "${PURPLE}────────────────────────${NC}"
            echo "Çıkmak için Ctrl+C kullanın..."
            sudo iftop
            read -p "Devam etmek için Enter..."
            ;;
        15)
            read -p "Link girin: " url
            if command -v qrencode >/dev/null 2>&1; then
                qrencode -t UTF8 "$url"
                echo -e "${GREEN}QR kod oluşturuldu.${NC}"
            else
                echo -e "${RED}qrencode yüklü değil! (sudo apt install qrencode)${NC}"
            fi
            read -p "Devam etmek için Enter..."
            ;;
        16)
            echo -e "${PURPLE}Güncelleme Ve Haberler: t.me/em4nhackingui (Em4n Inc...)${NC}"
            read -p "Devam etmek için Enter..."
            ;;
        99)
            echo -e "${YELLOW}Gerekli kütüphaneler kuruluyor...${NC}"
            sudo apt update && sudo apt upgrade -y
            sudo apt install -y curl whois traceroute nmap iftop git wget unzip python3 python3-pip qrencode
            echo -e "${GREEN}Kurulum tamamlandı!${NC}"
            read -p "Devam etmek için Enter..."
            ;;
        0)
            echo -e "${CYAN}Çıkış yapılıyor...${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Geçersiz seçim!${NC}"
            sleep 1
            ;;
    esac
done
