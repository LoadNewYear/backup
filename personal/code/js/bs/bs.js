function bs(arr, target, start=0, end=arr.length-1) {
    if (start > end) {
        console.log('notfound');
        return -1;
    }

    const mid = Math.floor(start + end) / 2;

    if (arr[mid] == target) {
        console.log(arr[mid]);
        return 0;
    }

    if (arr[mid] > target) {
        bs(arr, target, 0, arr[mid]);
    }

    if (arr[mid] < target) {
        bs(arr, target, arr[mid], end);
    }
}

let arr = [1, 2, 3, 4, 5, 6, 7];
console.log(bs(arr, 4));
