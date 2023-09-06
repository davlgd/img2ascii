import ascii_img
import os 

fn main() {

    if os.args.len == 6 {
        show_ascii(os.args[1], os.args[2].f64(),os.args[3].f64(),os.args[4].bool(),os.args[5])
    }
    else if os.args.len == 2 && os.args[1] != "--help" && os.args[1] != "-h" {
        show_ascii(os.args[1], 0.15, 0.1, true, "default")
    }
    else { show_helper() }
}

fn show_ascii(file_name string, sx f64, sy f64, gs bool, st string){

    img := ascii_img.from_file(file_name,
        scale_x: sx,
        scale_y: sy,
        grayscale: gs,
        channels: .auto,
        style: ascii_img.styles[st]
    ) or {
        err.msg()
    }
    println(img)
}

fn show_helper() {
    app_name := os.args[0]
    
    println("An application to convert an image to ASCII art.")
    println("")
    println("Usage:")
    println("$app_name [file] [scale_x] [scale_y] [grayscale] [style]")
    println("")
    println("  scale_x/y    between 0.1 and 1.0")
    println("  grayscale    false or true")
    println("  style        default, minimal, nihongo or blocks")
    println("")
    println("Compiled with Vlang, using ascii_img module : https://github.com/islonely/ascii_img")
}
