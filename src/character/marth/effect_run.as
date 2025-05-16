// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//effect_run

package 
{
    import flash.display.MovieClip;

    public dynamic class effect_run extends MovieClip 
    {

        public function effect_run()
        {
            addFrameScript(9, this.frame10);
        }

        internal function frame10():*
        {
            stop();
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

