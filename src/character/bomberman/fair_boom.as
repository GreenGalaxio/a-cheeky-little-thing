// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fair_boom

package 
{
    import flash.display.MovieClip;

    public dynamic class fair_boom extends MovieClip 
    {

        public function fair_boom()
        {
            addFrameScript(10, this.frame11);
        }

        internal function frame11():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

