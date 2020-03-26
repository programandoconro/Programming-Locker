import PyPDF2
import os

# os.system('sh get_data.sh')


def pdfs_to_txt(path):

    files = []
    for i in os.listdir(path):
        if i.endswith('.pdf'):
            files.append(i)
            files.sort()
    pages = []
    noysy_data = []

    for i in files:
        pdfFileObj = open(i, 'rb')
        pdfReader = PyPDF2.PdfFileReader(pdfFileObj)
        n_pag = pdfReader.numPages
        for j in range(0, n_pag):
            pageObj = pdfReader.getPage(j)
            pages.append(pageObj.extractText())
            noysy_data.append(pages)

    os.system("touch noisy_data.txt")
    txt = open("noisy_data.txt", "w")
    data = ''
    for i in range(0, len(noysy_data)):
        r = data.join(noysy_data[i])
    txt.write(r)
    txt.close()
