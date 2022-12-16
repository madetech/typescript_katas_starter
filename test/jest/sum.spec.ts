import { sum, subtract } from '@/index';

describe('sum', () => {
  it('should sum 2 numbers', () => {
    const result = sum(1,1)
    expect(result).toBe(2)
  });
});

describe('subtract', () => {
  it('should subtract 2 numbers', () => {
    const result = subtract(3,1)
    expect(result).toBe(2)
  });
});