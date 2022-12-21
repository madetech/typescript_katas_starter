import { sum } from '@/sum';

describe('sum', () => {
  it('should sum 2 numbers', () => {
    const result = sum(1,1)
    expect(result).toBe(2)
  });
});
