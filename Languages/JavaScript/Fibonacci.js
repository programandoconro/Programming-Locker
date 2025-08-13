
// Mine
function fibonacci(n) {
    let prev = [0, 1, 1];

    for (let i = 0; i <= 2; i++) {
        if (n >= i) {
            console.log(prev[i]);
        }
    }

    if (n <= 2) return;

    for (let i = 2; i < n; i++) {
        const next = prev[i] + prev[i - 1];
        prev.push(next);
        console.log(next);
    }
}

// ChatGPT
function fibonacci(n) {
    if (n < 0) return [];
    const seq = [0, 1];
    for (let i = 2; i < n; i++) {
        seq.push(seq[i - 1] + seq[i - 2]);
    }
    return seq.slice(0, n);
}
