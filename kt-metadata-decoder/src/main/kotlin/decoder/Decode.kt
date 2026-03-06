package decoder

import kotlinx.metadata.jvm.KotlinClassMetadata
import kotlinx.metadata.*
import java.io.File

fun printKmClass(kmClass: KmClass, indent: String = "") {
    println("${'$'}indent class: ${'$'}{kmClass.name}")
    for (f in kmClass.functions) {
        println("${'$'}indent  fun: ${'$'}{f.name}")
    }
    for (p in kmClass.properties) {
        println("${'$'}indent  prop: ${'$'}{p.name}")
    }
}

fun processBytes(bytes: ByteArray, path: String) {
    val metadata = KotlinClassMetadata.read(bytes)
    if (metadata == null) {
        println("$path: not kotlin metadata")
        return
    }
    when (metadata) {
        is KotlinClassMetadata.Class -> {
            val km = metadata.toKmClass()
            println("File: $path -> Class metadata")
            printKmClass(km)
        }
        is KotlinClassMetadata.FileFacade -> {
            val pkg = metadata.toKmPackage()
            println("File: $path -> FileFacade (package)")
            for (f in pkg.functions) println("  fun: ${'$'}{f.name}")
            for (p in pkg.properties) println("  prop: ${'$'}{p.name}")
        }
        is KotlinClassMetadata.SyntheticClass -> println("File: $path -> SyntheticClass")
        is KotlinClassMetadata.MultiFileClassPart -> {
            val pkg = metadata.toKmPackage()
            println("File: $path -> MultiFileClassPart")
            for (f in pkg.functions) println("  fun: ${'$'}{f.name}")
        }
        is KotlinClassMetadata.MultiFileClass -> println("File: $path -> MultiFileClass")
        else -> println("File: $path -> Unknown metadata type: ${'$'}{metadata::class}")
    }
}

fun processFile(path: String) {
    try {
        val bytes = File(path).readBytes()
        processBytes(bytes, path)
    } catch (e: Exception) {
        System.err.println("Failed $path: ${'$'}e")
    }
}

fun main(args: Array<String>) {
    val root = if (args.isNotEmpty()) args[0] else "."
    val f = File(root)
    if (f.isFile) {
        processFile(f.absolutePath)
        return
    }
    f.walkTopDown().forEach { file ->
        if (file.isFile && file.name.endsWith(".kotlin_metadata")) {
            processFile(file.absolutePath)
        }
    }
}
