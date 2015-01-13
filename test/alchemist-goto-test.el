;;; alchemist-goto-test.el ---

;; Copyright © 2014-2015 Samuel Tonini
;;
;; Author: Samuel Tonini <tonini.samuel@gmail.com>

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(ert-deftest extract-function ()
  (should (equal (alchemist-goto-extract-function ":gen_tcp.accept")
                 "accept"))
  (should (equal (alchemist-goto-extract-function ":erlang")
                 nil))
  (should (equal (alchemist-goto-extract-function "List.duplicate")
                 "duplicate"))
  (should (equal (alchemist-goto-extract-function "String.Chars.impl_for")
                 "impl_for"))
  (should (equal (alchemist-goto-extract-function "String.Chars.Atom")
                 nil)))

(ert-deftest extract-module ()
  (should (equal (alchemist-goto-extract-module ":gen_tcp.accept")
                 ":gen_tcp"))
  (should (equal (alchemist-goto-extract-module ":erlang")
                 ":erlang"))
  (should (equal (alchemist-goto-extract-module "List.duplicate")
                 "List"))
  (should (equal (alchemist-goto-extract-module "String.Chars.impl_for")
                 "String.Chars"))
  (should (equal (alchemist-goto-extract-module "String.Chars.Atom")
                 "String.Chars.Atom"))
  (should (equal (alchemist-goto-extract-module "to_string")
                 nil)))

(ert-deftest get-module-source ()
  (should (string-match-p "elixir\/lib\/list\\.ex" (alchemist-goto-get-module-source "List")))
  )

(provide 'alchemist-goto-test)

;;; alchemist-goto-test.el ends here
