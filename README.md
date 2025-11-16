# TEST CASE - PT ARTHA DWARA DIGITAL - MOBILE DEVELOPER

# SIMPLE TICKETING APP

# FOLDER STRUCTURE
# core/
- Berisi folder-folder esensial untuk digunakan pada keseluruhan aplikasi.

    # core/class/
    - case.dart     = Merupakan suatu class wrapper untuk state-state yang dapat dipanggil pada keadaan layar tertentu (Initial, Loading, Error, dll. ).
    - either.dart   = Adalah class fungsional untuk handling success/error dalam bentuk Left atau Right.

    # core/navigator/
    - navigator_service.dart = Merupakan suatu class custom yang menangani kombinasi dari GlobalKey (untuk navigasi dan locator context), dengan GetIt, agar bisa dipakai secara global dalam aplikasi, dan mempermudah proses pemanggilan navigasi.

    # core/route/
    - route_generator.dart = Class untuk registrasi routing dari setiap halaman.

    # core/service/
    - core_dependencies.dart = Adalah suatu class untuk inisialisasi dependency, dengan singleton (Getit).

# presentation/
Folder untuk seluruh tampilan dalam aplikasi, dan material class.

    -  presentation/add_pages/      = Form penambahan tiket baru.
    -  presentation/detail_pages/   = Merupakan form untuk edit status ticket, dan detail dari ticket.
    -  presentation/list_pages/     = Halaman home dan daftar tiket, dan button add ticket.
    -  presentation/splash_page/    = Halaman splash screen, serta inisiasi esensial data.
    -  presentation/app_material/   = Folder untuk Theme Global (colors, font, theme, etc)

Di dalam masing-masing folder untuk tampilan (terkecuali app_material) berisi folder-folder berikut:

    - ../controller     = folder sebagai suatu pusat pengontrol data antara ViewModel, Service, ataupun Argument. Proses inisiasi aplikasi (setelah widget mounting) juga di set dari sini (onReady), dan reusability ChangeNotifier dengan mixin terhadap controller.
    - ../service        = folder untuk proses pemanggilan datasaource dari API atau local preferences (untuk test case ini),  untuk kemudian dihubungkan dengan model.
    - ../model          = folder yang berisi model data dan view model. Pada testcase ini view model juga digunakan untuk listener dan proses after effects, ataupun state tanpa mengganggu kode pada UI (view).
    - ../view           = folder untuk tampilan, umumnya apabila diperlukan terdapat folder component sebagai sub folder untk menyimpan komponen-komponen dalam bentuk widget.


# ui_kit/
- Folder komponen UI yang bersifat global dan reusable, disini terdapat file constant yang digunakan untuk menyimpan konstan string yang dipakai secara berulang dan terus-menerus.

# util/
- Berisi folder utility atau helper yang digunakan pada aplikasi.
    # util/extension/
    - Berisi folder untuk ekstensi-ekstensi dari class-class. Misalnya, BuildContext atau String.
        - ../extensions/context_extension.dart  = Class untuk ekstensi BuildContext. Biasanya digunakan untuk ekstensi untuk menambah kustomisasi, readibility dan reusability suatu class, tanpa mengubah class asli.
        - ../extension.dart                     = Hanya berisi file untuk import part, sehingga file part of tidak berantakan dan readibility lebih baik.

# main.dart
- Merupakan entry point dari aplikasi yang menginisialisasi dependency, routing dan class AppMaterial.
    

# Langkah Penggunaan Aplikasi

- Unduh zip pada repository tercantum di bawah :

https://github.com/Brahmanax23/PT-Dwara-Artha-Digital---Mobile-Dev-Test-Case/tree/main

- Setelah unzip, pastikan Flutter dan sdk version sesuai, LTS, atau menggunakan FVM. Aplikasi ini menggunakan

Flutter SDK    : 3.24.0
Dart SDK       : 3.5.0

- Pilih device untuk menjalankan debug pada kanan bawah, gunakan AVD (Android Virtual Device), Emulator, atau gunakan telepon genggam pengguna (developer mode) untuk menjalankan aplikasi.

- Apabila menggunakan VS code sebagai IDE, bisa gunakan 'Run' pada 'Menu Bar', lalu 'Start Debugging' atau 'Run without debugging'. Disediakan juga settings.json untuk proses debugging dengan menekan debug icon pada 'Activity Bar', dan pada dropdown 'RUN AND DEBUG' tekan tombol play pada 'app-testcase'.

- Setelah proses debug berjalan, baik pada AVD atau telepon genggam, apabila icon flutter splash muncul dan berlanjut ke splash screen warna orange, maka aplikasi berhasil di inisiasi.

- Dari splash screen orange, user akan navigasi ke halaman utama Ticket List, yang merupakan daftar tiket dengan data dummy. Dengan masing-masing kategori pada TabBar yaitu All. Open, In Progress, dan Done. Masing-masing kategori merupakan representasi dari status tiket. User dapat menekan tab bar sesuai kategori untuk melakukan filter data.

- Pada masing-masing item ticket, user dapat menekan deskripsi untuk expand informasi dari deskripsi dari masing-masing tiket

Di bawah ini adalah langkah - langkah untuk pengolahan data tiket:

    1. Add Ticket (Penambahan Ticket Baru)

    - Tekan FloatingActionButton di kanan bawah (button dengan icon '+') untuk menambah tiket baru.
    - Isi masing-masing form yang diinginkan
    - Title ticket wajib diisi apabila kosong, maka akan terkena validasi ketika menekan button Submit Ticket.
    - Tekan Submit Ticket button untuk mendaftarkan tiket.
    - User akan dinavigasi ke halaman Ticket List, karena proses sorting via incremental id, ticket terbaru user akan berada pada daftar list paling bawah.

    2. Edit Ticket (Proses edit existing ticket)
    
    - Tekan Item ticket dalam list yang ingin diedit.
    - Pada halaman Detail $ Edit Ticket user dapat melihat detail dari ticket terpilih.
    - Pada halaman ini user dapat melakukan cek detail dan juga mengubah status dari ticket.
    - User tidak dapat mengubah Title, Desription dan Category.
    - Tekan Update Ticket untuk melakukan update ticket.
    - User akan di-redirect ke halaman Ticket List, ticket terupdate akan sesuai dengan baris sebelumnya.



