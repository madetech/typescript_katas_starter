import { subtract } from '@/subtract'

describe('subtract', () => {
  it('should subtract 2 numbers', () => {
    const result = subtract(3,1)
    expect(result).toBe(2)
  });
});