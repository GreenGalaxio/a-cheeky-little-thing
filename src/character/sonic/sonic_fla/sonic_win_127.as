// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_win_127

package sonic_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class sonic_win_127 extends MovieClip 
    {

        public var self:*;
        public var whichWin:*;
        public var winString:*;

        public function sonic_win_127()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 19, this.frame20, 23, this.frame24, 69, this.frame70, 74, this.frame75, 119, this.frame120);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.whichWin = 0;
                this.winString = "win";
                if (SSF2API.isReady())
                {
                    this.whichWin = SSF2API.randomInteger(1, 3);
                };
                this.winString = (this.winString + this.whichWin);
                this.gotoAndPlay(this.winString);
            };
        }

        internal function frame4():*
        {
            SSF2API.playSound("new_Sonic_win");
        }

        internal function frame20():*
        {
            stop();
        }

        internal function frame24():*
        {
            SSF2API.playSound("new_Sonic_win2");
        }

        internal function frame70():*
        {
            stop();
        }

        internal function frame75():*
        {
            SSF2API.playSound("new_Sonic_win3");
        }

        internal function frame120():*
        {
            stop();
        }


    }
}//package sonic_fla

