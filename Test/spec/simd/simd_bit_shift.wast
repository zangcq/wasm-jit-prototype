;; Test all the bit shift operators on major boundary values and all special values.

(module
  (func (export "i8x16.shl") (param $0 v128) (param $1 i32) (result v128) (i8x16.shl (local.get $0) (local.get $1)))
  (func (export "i8x16.shr_s") (param $0 v128) (param $1 i32) (result v128) (i8x16.shr_s (local.get $0) (local.get $1)))
  (func (export "i8x16.shr_u") (param $0 v128) (param $1 i32) (result v128) (i8x16.shr_u (local.get $0) (local.get $1)))

  (func (export "i16x8.shl") (param $0 v128) (param $1 i32) (result v128) (i16x8.shl (local.get $0) (local.get $1)))
  (func (export "i16x8.shr_s") (param $0 v128) (param $1 i32) (result v128) (i16x8.shr_s (local.get $0) (local.get $1)))
  (func (export "i16x8.shr_u") (param $0 v128) (param $1 i32) (result v128) (i16x8.shr_u (local.get $0) (local.get $1)))

  (func (export "i32x4.shl") (param $0 v128) (param $1 i32) (result v128) (i32x4.shl (local.get $0) (local.get $1)))
  (func (export "i32x4.shr_s") (param $0 v128) (param $1 i32) (result v128) (i32x4.shr_s (local.get $0) (local.get $1)))
  (func (export "i32x4.shr_u") (param $0 v128) (param $1 i32) (result v128) (i32x4.shr_u (local.get $0) (local.get $1)))
)

;; i8x16
(assert_return (invoke "i8x16.shl" (v128.const i8x16 -128 -64 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D)
                                   (i32.const 1))
                                   (v128.const i8x16 0 -128 0 2 4 6 8 10 12 14 16 18 0x14 0x16 0x18 0x1A))
(assert_return (invoke "i8x16.shl" (v128.const i8x16 0xAA 0xBB 0xCC 0xDD 0xEE 0xFF 0xA0 0xB0 0xC0 0xD0 0xE0 0xF0 0x0A 0x0B 0x0C 0x0D)
                                   (i32.const 4))
                                   (v128.const i8x16 0xA0 0xB0 0xC0 0xD0 0xE0 0xF0 0x00 0x00 0x00 0x00 0x00 0x00 0xA0 0xB0 0xC0 0xD0))
(assert_return (invoke "i8x16.shl" (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F)
                                   (i32.const 8))
                                   (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F))
(assert_return (invoke "i8x16.shl" (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F)
                                   (i32.const 32))
                                   (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F))
(assert_return (invoke "i8x16.shl" (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F)
                                   (i32.const 128))
                                   (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F))
(assert_return (invoke "i8x16.shl" (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F)
                                   (i32.const 256))
                                   (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F))
(assert_return (invoke "i8x16.shr_u" (v128.const i8x16 -128 -64 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D)
                                     (i32.const 1))
                                     (v128.const i8x16 64 96 0 0 1 1 2 2 3 3 4 4 0x05 0x05 0x06 0x06))
(assert_return (invoke "i8x16.shr_u" (v128.const i8x16 0xAA 0xBB 0xCC 0xDD 0xEE 0xFF 0xA0 0xB0 0xC0 0xD0 0xE0 0xF0 0x0A 0x0B 0x0C 0x0D)
                                     (i32.const 4))
                                     (v128.const i8x16 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F 0x00 0x00 0x00 0x00))
(assert_return (invoke "i8x16.shr_u" (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F)
                                     (i32.const 8))
                                     (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F))
(assert_return (invoke "i8x16.shr_u" (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F)
                                     (i32.const 32))
                                     (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F))
(assert_return (invoke "i8x16.shr_u" (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F)
                                     (i32.const 128))
                                     (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F))
(assert_return (invoke "i8x16.shr_u" (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F)
                                     (i32.const 256))
                                     (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F))
(assert_return (invoke "i8x16.shr_s" (v128.const i8x16 -128 -64 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D)
                                     (i32.const 1))
                                     (v128.const i8x16 192 224 0 0 1 1 2 2 3 3 4 4 0x05 0x05 0x06 0x06))
(assert_return (invoke "i8x16.shr_s" (v128.const i8x16 0xAA 0xBB 0xCC 0xDD 0xEE 0xFF 0xA0 0xB0 0xC0 0xD0 0xE0 0xF0 0x0A 0x0B 0x0C 0x0D)
                                     (i32.const 4))
                                     (v128.const i8x16 0xFA 0xFB 0xFC 0xFD 0xFE 0xFF 0xFA 0xFB 0xFC 0xFD 0xFE 0xFF 0x00 0x00 0x00 0x00))
(assert_return (invoke "i8x16.shr_s" (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F)
                                     (i32.const 8))
                                     (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F))
(assert_return (invoke "i8x16.shr_s" (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F)
                                     (i32.const 32))
                                     (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F))
(assert_return (invoke "i8x16.shr_s" (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F)
                                     (i32.const 128))
                                     (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F))
(assert_return (invoke "i8x16.shr_s" (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F)
                                     (i32.const 256))
                                     (v128.const i8x16 0 1 2 3 4 5 6 7 8 9 0x0A 0x0B 0x0C 0x0D 0x0e 0x0F))

;; i16x8
(assert_return (invoke "i16x8.shl" (v128.const i16x8 -128 -64 0 1 2 3 4 5)
                                   (i32.const 1))
                                   (v128.const i16x8 65280 65408 0 2 4 6 8 10))
(assert_return (invoke "i16x8.shl" (v128.const i16x8 0xAABB 0xCCDD 0xEEFF 0xA0B0 0xC0D0 0xE0F0 0x0A0B 0x0C0D)
                                   (i32.const 4))
                                   (v128.const i16x8 0xABB0 0xCDD0 0xEFF0 0xB00 0xD00 0xF00 0xA0B0 0xC0D0))
(assert_return (invoke "i16x8.shl" (v128.const i16x8 0 1 2 3 4 5 6 7)
                                   (i32.const 8))
                                   (v128.const i16x8 0 256 512 768 1024 1280 1536 1792))
(assert_return (invoke "i16x8.shl" (v128.const i16x8 0 1 2 3 4 5 6 7)
                                   (i32.const 32))
                                   (v128.const i16x8 0 1 2 3 4 5 6 7))
(assert_return (invoke "i16x8.shl" (v128.const i16x8 0 1 2 3 4 5 6 7)
                                   (i32.const 128))
                                   (v128.const i16x8 0 1 2 3 4 5 6 7))
(assert_return (invoke "i16x8.shl" (v128.const i16x8 0 1 2 3 4 5 6 7)
                                   (i32.const 256))
                                   (v128.const i16x8 0 1 2 3 4 5 6 7))
(assert_return (invoke "i16x8.shr_u" (v128.const i16x8 -128 -64 0 1 2 3 4 5)
                                     (i32.const 1))
                                     (v128.const i16x8 32704 32736 0 0 1 1 2 2))
(assert_return (invoke "i16x8.shr_u" (v128.const i16x8 0xAABB 0xCCDD 0xEEFF 0xA0B0 0xC0D0 0xE0F0 0x0A0B 0x0C0D)
                                     (i32.const 4))
                                     (v128.const i16x8 0xAAB 0xCCD 0xEEF 0xA0B 0xC0D 0xE0F 0x0A0 0x0C0))
(assert_return (invoke "i16x8.shr_u" (v128.const i16x8 0 1 2 3 4 5 6 7)
                                     (i32.const 8))
                                     (v128.const i16x8 0 0 0 0 0 0 0 0))
(assert_return (invoke "i16x8.shr_u" (v128.const i16x8 0 1 2 3 4 5 6 7)
                                     (i32.const 32))
                                     (v128.const i16x8 0 1 2 3 4 5 6 7))
(assert_return (invoke "i16x8.shr_u" (v128.const i16x8 0 1 2 3 4 5 6 7)
                                     (i32.const 128))
                                     (v128.const i16x8 0 1 2 3 4 5 6 7))
(assert_return (invoke "i16x8.shr_u" (v128.const i16x8 0 1 2 3 4 5 6 7)
                                     (i32.const 256))
                                     (v128.const i16x8 0 1 2 3 4 5 6 7))
(assert_return (invoke "i16x8.shr_s" (v128.const i16x8 -128 -64 0 1 2 3 4 5)
                                     (i32.const 1))
                                     (v128.const i16x8 65472 65504 0 0 1 1 2 2))
(assert_return (invoke "i16x8.shr_s" (v128.const i16x8 0xAABB 0xCCDD 0xEEFF 0xA0B0 0xC0D0 0xE0F0 0x0A0B 0x0C0D)
                                     (i32.const 4))
                                     (v128.const i16x8 0xFAAB 0xFCCD 0xFEEF 0xFA0B 0xFC0D 0xFE0F 0x00A0 0x00C0))
(assert_return (invoke "i16x8.shr_s" (v128.const i16x8 0 1 2 3 4 5 6 7)
                                     (i32.const 8))
                                     (v128.const i16x8 0 0 0 0 0 0 0 0))
(assert_return (invoke "i16x8.shr_s" (v128.const i16x8 0 1 2 3 4 5 6 7)
                                     (i32.const 32))
                                     (v128.const i16x8 0 1 2 3 4 5 6 7))
(assert_return (invoke "i16x8.shr_s" (v128.const i16x8 0 1 2 3 4 5 6 7)
                                     (i32.const 128))
                                     (v128.const i16x8 0 1 2 3 4 5 6 7))
(assert_return (invoke "i16x8.shr_s" (v128.const i16x8 0 1 2 3 4 5 6 7)
                                     (i32.const 256))
                                     (v128.const i16x8 0 1 2 3 4 5 6 7))

;; i32x4
(assert_return (invoke "i32x4.shl" (v128.const i32x4 -2147483648 -32768 0 0x0A0B0C0D)
                                   (i32.const 1))
                                   (v128.const i32x4 0 4294901760 0 0x1416181A))
(assert_return (invoke "i32x4.shl" (v128.const i32x4 0xAABBCCDD 0xEEFFA0B0 0xC0D0E0F0 0x0A0B0C0D)
                                   (i32.const 4))
                                   (v128.const i32x4 0xABBCCDD0 0xEFFA0B00 0x0D0E0F00 0xA0B0C0D0))
(assert_return (invoke "i32x4.shl" (v128.const i32x4 0 1 0x0E 0x0F)
                                   (i32.const 8))
                                   (v128.const i32x4 0 256 0x00000E00 0x00000F00))
(assert_return (invoke "i32x4.shl" (v128.const i32x4 0 1 0x0E 0x0F)
                                   (i32.const 32))
                                   (v128.const i32x4 0 1 0x0E 0x0F))
(assert_return (invoke "i32x4.shl" (v128.const i32x4 0 1 0x0E 0x0F)
                                   (i32.const 128))
                                   (v128.const i32x4 0 1 0x0E 0x0F))
(assert_return (invoke "i32x4.shl" (v128.const i32x4 0 1 0x0E 0x0F)
                                   (i32.const 256))
                                   (v128.const i32x4 0 1 0x0E 0x0F))
(assert_return (invoke "i32x4.shr_u" (v128.const i32x4 -2147483648 -32768 0x0000000C 0x0000000D)
                                     (i32.const 1))
                                     (v128.const i32x4 1073741824 2147467264 0x00000006 0x00000006))
(assert_return (invoke "i32x4.shr_u" (v128.const i32x4 0xAABBCCDD 0xEEFFA0B0 0xC0D0E0F0 0x0A0B0C0D)
                                     (i32.const 4))
                                     (v128.const i32x4 0x0AABBCCD 0x0EEFFA0B 0x0C0D0E0F 0x00A0B0C0))
(assert_return (invoke "i32x4.shr_u" (v128.const i32x4 0 1 0x0E 0x0F)
                                     (i32.const 8))
                                     (v128.const i32x4 0 0 0x00000000 0x00000000))
(assert_return (invoke "i32x4.shr_u" (v128.const i32x4 0 1 0x0E 0x0F)
                                     (i32.const 32))
                                     (v128.const i32x4 0 1 0x0E 0x0F))
(assert_return (invoke "i32x4.shr_u" (v128.const i32x4 0 1 0x0E 0x0F)
                                     (i32.const 128))
                                     (v128.const i32x4 0 1 0x0E 0x0F))
(assert_return (invoke "i32x4.shr_u" (v128.const i32x4 0 1 0x0E 0x0F)
                                     (i32.const 256))
                                     (v128.const i32x4 0 1 0x0E 0x0F))
(assert_return (invoke "i32x4.shr_s" (v128.const i32x4 -2147483648 -32768 0x0C 0x0D)
                                     (i32.const 1))
                                     (v128.const i32x4 3221225472 4294950912 0x06 0x06))
(assert_return (invoke "i32x4.shr_s" (v128.const i32x4 0xAABBCCDD 0xEEFFA0B0 0xC0D0E0F0 0x0A0B0C0D)
                                     (i32.const 4))
                                     (v128.const i32x4 0xfaabbccd 0xFEEFFA0B 0xFC0D0E0F 0x00A0B0C0))
(assert_return (invoke "i32x4.shr_s" (v128.const i32x4 0 1 0x0E 0x0F)
                                     (i32.const 8))
                                     (v128.const i32x4 0 0 0x00000000 0x00000000))
(assert_return (invoke "i32x4.shr_s" (v128.const i32x4 0 1 0x0E 0x0F)
                                     (i32.const 32))
                                     (v128.const i32x4 0 1 0x0E 0x0F))
(assert_return (invoke "i32x4.shr_s" (v128.const i32x4 0 1 0x0E 0x0F)
                                     (i32.const 128))
                                     (v128.const i32x4 0 1 0x0E 0x0F))
(assert_return (invoke "i32x4.shr_s" (v128.const i32x4 0 1 0x0E 0x0F)
                                     (i32.const 256))
                                     (v128.const i32x4 0 1 0x0E 0x0F))


;; Combination

(module (memory 1)
  (func (export "i8x16.shl-in-block")
    (block
      (drop
        (block (result v128)
          (i8x16.shl
            (block (result v128) (v128.load (i32.const 0))) (i32.const 1)
          )
        )
      )
    )
  )
  (func (export "i8x16.shr_s-in-block")
    (block
      (drop
        (block (result v128)
          (i8x16.shr_s
            (block (result v128) (v128.load (i32.const 0))) (i32.const 1)
          )
        )
      )
    )
  )
  (func (export "i8x16.shr_u-in-block")
    (block
      (drop
        (block (result v128)
          (i8x16.shr_u
            (block (result v128) (v128.load (i32.const 0))) (i32.const 1)
          )
        )
      )
    )
  )
  (func (export "i16x8.shl-in-block")
    (block
      (drop
        (block (result v128)
          (i16x8.shl
            (block (result v128) (v128.load (i32.const 0))) (i32.const 1)
          )
        )
      )
    )
  )
  (func (export "i16x8.shr_s-in-block")
    (block
      (drop
        (block (result v128)
          (i16x8.shr_s
            (block (result v128) (v128.load (i32.const 0))) (i32.const 1)
          )
        )
      )
    )
  )
  (func (export "i16x8.shr_u-in-block")
    (block
      (drop
        (block (result v128)
          (i16x8.shr_u
            (block (result v128) (v128.load (i32.const 0))) (i32.const 1)
          )
        )
      )
    )
  )
  (func (export "i32x4.shl-in-block")
    (block
      (drop
        (block (result v128)
          (i32x4.shl
            (block (result v128) (v128.load (i32.const 0))) (i32.const 1)
          )
        )
      )
    )
  )
  (func (export "i32x4.shr_s-in-block")
    (block
      (drop
        (block (result v128)
          (i32x4.shr_s
            (block (result v128) (v128.load (i32.const 0))) (i32.const 1)
          )
        )
      )
    )
  )
  (func (export "i32x4.shr_u-in-block")
    (block
      (drop
        (block (result v128)
          (i32x4.shr_u
            (block (result v128) (v128.load (i32.const 0))) (i32.const 1)
          )
        )
      )
    )
  )
  (func (export "nested-i8x16.shl")
    (drop
      (i8x16.shl
        (i8x16.shl
          (i8x16.shl
            (v128.load (i32.const 0)) (i32.const 1)
          )
          (i32.const 1)
        )
        (i32.const 1)
      )
    )
  )
  (func (export "nested-i8x16.shr_s")
    (drop
      (i8x16.shr_s
        (i8x16.shr_s
          (i8x16.shr_s
            (v128.load (i32.const 0)) (i32.const 1)
          )
          (i32.const 1)
        )
        (i32.const 1)
      )
    )
  )
  (func (export "nested-i8x16.shr_u")
    (drop
      (i8x16.shr_u
        (i8x16.shr_u
          (i8x16.shr_u
            (v128.load (i32.const 0)) (i32.const 1)
          )
          (i32.const 1)
        )
        (i32.const 1)
      )
    )
  )
  (func (export "nested-i16x8.shl")
    (drop
      (i16x8.shl
        (i16x8.shl
          (i16x8.shl
            (v128.load (i32.const 0)) (i32.const 1)
          )
          (i32.const 1)
        )
        (i32.const 1)
      )
    )
  )
  (func (export "nested-i16x8.shr_s")
    (drop
      (i16x8.shr_s
        (i16x8.shr_s
          (i16x8.shr_s
            (v128.load (i32.const 0)) (i32.const 1)
          )
          (i32.const 1)
        )
        (i32.const 1)
      )
    )
  )
  (func (export "nested-i16x8.shr_u")
    (drop
      (i16x8.shr_u
        (i16x8.shr_u
          (i16x8.shr_u
            (v128.load (i32.const 0)) (i32.const 1)
          )
          (i32.const 1)
        )
        (i32.const 1)
      )
    )
  )
  (func (export "nested-i32x4.shl")
    (drop
      (i32x4.shl
        (i32x4.shl
          (i32x4.shl
            (v128.load (i32.const 0)) (i32.const 1)
          )
          (i32.const 1)
        )
        (i32.const 1)
      )
    )
  )
  (func (export "nested-i32x4.shr_s")
    (drop
      (i32x4.shr_s
        (i32x4.shr_s
          (i32x4.shr_s
            (v128.load (i32.const 0)) (i32.const 1)
          )
          (i32.const 1)
        )
        (i32.const 1)
      )
    )
  )
  (func (export "nested-i32x4.shr_u")
    (drop
      (i32x4.shr_u
        (i32x4.shr_u
          (i32x4.shr_u
            (v128.load (i32.const 0)) (i32.const 1)
          )
          (i32.const 1)
        )
        (i32.const 1)
      )
    )
  )
)



;; Type check

(assert_invalid (module (func (result v128) (i8x16.shl   (i32.const 0) (i32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i8x16.shr_s (i32.const 0) (i32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i8x16.shr_u (i32.const 0) (i32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i16x8.shl   (i32.const 0) (i32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i16x8.shr_s (i32.const 0) (i32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i16x8.shr_u (i32.const 0) (i32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i32x4.shl   (i32.const 0) (i32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i32x4.shr_s (i32.const 0) (i32.const 0)))) "type mismatch")
(assert_invalid (module (func (result v128) (i32x4.shr_u (i32.const 0) (i32.const 0)))) "type mismatch")

;; Unknown operators

(assert_malformed (module quote "(memory 1) (func (result v128) (i8x16.shl_s (v128.const i32x4 0 0 0 0)))") "unknown operator")
(assert_malformed (module quote "(memory 1) (func (result v128) (i8x16.shl_r (v128.const i32x4 0 0 0 0)))") "unknown operator")
(assert_malformed (module quote "(memory 1) (func (result v128) (i8x16.shr   (v128.const i32x4 0 0 0 0)))") "unknown operator")
(assert_malformed (module quote "(memory 1) (func (result v128) (i16x8.shl_s (v128.const i32x4 0 0 0 0)))") "unknown operator")
(assert_malformed (module quote "(memory 1) (func (result v128) (i16x8.shl_r (v128.const i32x4 0 0 0 0)))") "unknown operator")
(assert_malformed (module quote "(memory 1) (func (result v128) (i16x8.shr   (v128.const i32x4 0 0 0 0)))") "unknown operator")
(assert_malformed (module quote "(memory 1) (func (result v128) (i32x4.shl_s (v128.const i32x4 0 0 0 0)))") "unknown operator")
(assert_malformed (module quote "(memory 1) (func (result v128) (i32x4.shl_r (v128.const i32x4 0 0 0 0)))") "unknown operator")
(assert_malformed (module quote "(memory 1) (func (result v128) (i32x4.shr   (v128.const i32x4 0 0 0 0)))") "unknown operator")
(assert_malformed (module quote "(memory 1) (func (result v128) (f32x4.shl   (v128.const i32x4 0 0 0 0)))") "unknown operator")
(assert_malformed (module quote "(memory 1) (func (result v128) (f32x4.shr_s (v128.const i32x4 0 0 0 0)))") "unknown operator")
(assert_malformed (module quote "(memory 1) (func (result v128) (f32x4.shr_u (v128.const i32x4 0 0 0 0)))") "unknown operator")