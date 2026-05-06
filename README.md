# Basys 3 Voting Machine Project  
This project implements a digital voting system for three candidates using a state-machine-driven architecture.
## How it Works
The system is controlled by a central *
*State Machine** (`state_machine.v`) that transitions through four phases: 
1.  **IDLE (00):** System is waiting for an administrator to open voting.
2. **VOTING_OPEN (01):** Users can cast votes. LEDs flash to indicate the polls are open.
3.  **VOTING_CLOSED (10):** A transition state that lasts for 3 seconds.
4.  **DISPLAY_WIN (11):** The winner is calculated and shown on the 7-segment display.
 ## How to Use (Basys 3)
 ### 1. Opening the Polls * 
 Set the **Admin Code** using the switches. The code is `1000 1000 1000 1000`. *   Flip **UP** switches: `sw[15]`, `sw[11]`, `sw[7]`, and `sw[3]`. *   Press **btnD** (Bottom Button). *   *Note: Since the system runs on a 1Hz clock, you must hold the button for 1 second.*
 ### 2. Casting Votes Once the LEDs start flashing, voting is active:
 *   **btnL (Left):** Vote for Candidate 1. *   **btnC (Center):** Vote for Candidate 2. *   **btnR (Right):** Vote for Candidate 3. *   *Note: Hold each button for 1 second to ensure the vote is registered.*  
 ### 3. Closing the Polls 
 *   Ensure the Admin switches are still in the correct position. *   Press **btnD** (Bottom Button) and hold for 1 second.
 ### 4. Viewing Results
 *   Wait 3 seconds for the transition. *   The **Far Left** digit on the 7-segment display shows the winner (1, 2, or 3). *   The **Right Side** digits show the total number of votes cast.  ---  
## Known Bugs & Issues (Improvement Areas) 
### 1. Unresponsive Buttons (1Hz Clock) The state machine currently runs on a 1Hz clock. This is too slow for human interaction. If you tap a button quickly, the FPGA will miss it.  *   **Symptom:** You have to hold buttons down for a long time to vote.  ### 2. Vote Overflow (4-bit Counters) The counters are only 4 bits wide.  *   **Symptom:** If a candidate gets a 16th vote, the counter "wraps around" back to 0. This will make the results incorrect in a real election. 
### 3. Multiple Voting There is no "edge detection" on the buttons.  *   **Symptom:** If you hold the button for 3 seconds, the machine will count 3 separate votes. One press should only count once.
### 4. Tie Handling If two candidates have the same number of votes, the machine displays "0" as the winner. *   **Symptom:** A tie looks the same as "no winner."
